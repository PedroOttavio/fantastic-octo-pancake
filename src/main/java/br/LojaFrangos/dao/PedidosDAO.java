package br.LojaFrangos.dao;

import br.LojaFrangos.model.Funcionario;
import br.LojaFrangos.model.Usuario;
import br.LojaFrangos.model.Pedidos;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PedidosDAO {

    private final JdbcTemplate jdbcTemplate;
    private final FuncionarioDAO funcionarioDAO;
    private final UsuarioDAO usuarioDAO;

    private final RowMapper<Pedidos> rowMapper;

    public PedidosDAO(JdbcTemplate jdbcTemplate, FuncionarioDAO funcionarioDAO, UsuarioDAO usuarioDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.funcionarioDAO = funcionarioDAO;
        this.usuarioDAO = usuarioDAO;

        this.rowMapper = (rs, rowNum) -> {
            Pedidos pedido = new Pedidos();
            pedido.setCodigo_pedido(rs.getInt("codigo_pedido"));
            pedido.setDescricao(rs.getString("descricao"));
            pedido.setValor(rs.getDouble("valor"));
            pedido.setTipo_pedido(rs.getString("tipo_pedido"));

            int funcId = rs.getInt("funcionario_id");
            int usuarioId = rs.getInt("usuario_id");

            Funcionario funcionario = funcionarioDAO.buscar(funcId);
            Usuario usuario = usuarioDAO.buscar(usuarioId);

            pedido.setFuncionario(funcionario);
            pedido.setUsuario(usuario);

            return pedido;
        };
    }

    public List<Pedidos> listar() {
        String sql = "SELECT * FROM pedidos";
        return jdbcTemplate.query(sql, rowMapper);
    }

    public Pedidos buscar(int codigo) {
        String sql = "SELECT * FROM pedidos WHERE codigo_pedido = ?";
        try {
            return jdbcTemplate.queryForObject(sql, rowMapper, codigo);
        } catch (Exception e) {
            System.out.println("Erro ao buscar pedido: " + e.getMessage());
            return null;
        }
    }

    public String inserir(Pedidos pedido) {
        String sql = "INSERT INTO pedidos (descricao, valor, tipo_pedido, funcionario_id, usuario_id) VALUES (?, ?, ?, ?, ?)";
        try {
            int rows = jdbcTemplate.update(sql,
                    pedido.getDescricao(),
                    pedido.getValor(),
                    pedido.getTipo_pedido(),
                    pedido.getFuncionario().getId(),
                    pedido.getUsuario().getId());
            return rows > 0 ? "Inserido com sucesso!" : "Erro ao inserir.";
        } catch (Exception e) {
            System.out.println("Erro ao inserir pedido: " + e.getMessage());
            return "Erro ao inserir: " + e.getMessage();
        }
    }

    public String alterar(Pedidos pedido) {
        String sql = "UPDATE pedidos SET descricao = ?, valor = ?, tipo_pedido = ?, funcionario_id = ?, usuario_id = ? WHERE codigo_pedido = ?";
        try {
            int rows = jdbcTemplate.update(sql,
                    pedido.getDescricao(),
                    pedido.getValor(),
                    pedido.getTipo_pedido(),
                    pedido.getFuncionario().getId(),
                    pedido.getUsuario().getId(),
                    pedido.getCodigo_pedido());
            return rows > 0 ? "Alterado com sucesso!" : "Erro ao alterar.";
        } catch (Exception e) {
            System.out.println("Erro ao alterar pedido: " + e.getMessage());
            return "Erro ao alterar: " + e.getMessage();
        }
    }

    public String excluir(int codigo) {
        String sql = "DELETE FROM pedidos WHERE codigo_pedido = ?";
        try {
            int rows = jdbcTemplate.update(sql, codigo);
            return rows > 0 ? "Excluído com sucesso!" : "Erro ao excluir.";
        } catch (Exception e) {
            System.out.println("Erro ao excluir pedido: " + e.getMessage());
            return "Erro ao excluir: " + e.getMessage();
        }
    }
}
