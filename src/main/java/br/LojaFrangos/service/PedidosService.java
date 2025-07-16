package br.LojaFrangos.service;

import br.LojaFrangos.dao.PedidosDAO;
import br.LojaFrangos.dao.FuncionarioDAO;
import br.LojaFrangos.dao.UsuarioDAO;
import br.LojaFrangos.model.Funcionario;
import br.LojaFrangos.model.Usuario;
import br.LojaFrangos.model.Pedidos;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PedidosService {

    private final PedidosDAO pedidosDAO;
    private final FuncionarioDAO funcionarioDAO;
    private final UsuarioDAO usuarioDAO;

    public PedidosService(PedidosDAO pedidosDAO, FuncionarioDAO funcionarioDAO, UsuarioDAO usuarioDAO) {
        this.pedidosDAO = pedidosDAO;
        this.funcionarioDAO = funcionarioDAO;
        this.usuarioDAO = usuarioDAO;
    }

    public List<Pedidos> listar() {
        return pedidosDAO.listar();
    }

    public Pedidos buscar(int codigo) {
        return pedidosDAO.buscar(codigo);
    }

    public String inserir(Pedidos pedido) {
        Funcionario funcionario = funcionarioDAO.buscar(pedido.getFuncionario().getId());
        Usuario usuario = usuarioDAO.buscar(pedido.getUsuario().getId());

        if (funcionario == null) {
            return "Erro: Funcionário não encontrado.";
        }

        if (usuario == null) {
            return "Erro: Usuário não encontrado.";
        }

        return pedidosDAO.inserir(pedido);
    }

    public String alterar(Pedidos pedido) {
        Funcionario funcionario = funcionarioDAO.buscar(pedido.getFuncionario().getId());
        Usuario usuario = usuarioDAO.buscar(pedido.getUsuario().getId());

        if (funcionario == null) {
            return "Erro: Funcionário não encontrado.";
        }

        if (usuario == null) {
            return "Erro: Usuário não encontrado.";
        }

        return pedidosDAO.alterar(pedido);
    }

    public String excluir(int codigo) {
        return pedidosDAO.excluir(codigo);
    }
}
