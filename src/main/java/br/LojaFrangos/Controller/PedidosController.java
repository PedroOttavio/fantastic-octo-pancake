package br.LojaFrangos.Controller;

import br.LojaFrangos.model.Funcionario;
import br.LojaFrangos.model.Usuario;
import br.LojaFrangos.model.Pedidos;
import br.LojaFrangos.service.FuncionarioService;
import br.LojaFrangos.service.UsuarioService;
import br.LojaFrangos.service.PedidosService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/pedidos")
public class PedidosController {

    private final PedidosService pedidosService;
    private final FuncionarioService funcionarioService;
    private final UsuarioService usuarioService;

    public PedidosController(PedidosService pedidosService, FuncionarioService funcionarioService, UsuarioService usuarioService) {
        this.pedidosService = pedidosService;
        this.funcionarioService = funcionarioService;
        this.usuarioService = usuarioService;
    }

    @GetMapping
    public String listarPedidos(
            @RequestParam(value = "opcao", required = false) String opcao,
            @RequestParam(value = "info", required = false) Integer info,
            @RequestParam(value = "msg", required = false) String msg,
            Model model,
            RedirectAttributes redirectAttributes
    ) {

        if (msg != null && !msg.isEmpty()) {
            model.addAttribute("msg", msg);
        }

        if ("editar".equalsIgnoreCase(opcao) && info != null) {
            Pedidos pedido = pedidosService.buscar(info);
            if (pedido != null) {
                model.addAttribute("pedidoEditar", pedido);
            } else {
                model.addAttribute("msg", "Pedido não encontrado.");
            }

        } else if ("excluir".equalsIgnoreCase(opcao) && info != null) {
            String resultado = pedidosService.excluir(info);
            redirectAttributes.addFlashAttribute("msg", resultado);
            return "redirect:/pedidos";
        }

        List<Pedidos> pedidos = pedidosService.listar();
        List<Funcionario> funcionarios = funcionarioService.listar();
        List<Usuario> usuarios = usuarioService.listar();

        model.addAttribute("pedidos", pedidos);
        model.addAttribute("funcionarios", funcionarios);
        model.addAttribute("usuarios", usuarios);

        return "pages/pedido";
    }

    @PostMapping
    public String salvarPedido(
            @RequestParam(value = "codigo_pedido", required = false) Integer codigo,
            @RequestParam(value = "funcionarioId", required = false) Integer funcionarioId,
            @RequestParam(value = "usuarioId", required = false) Integer usuarioId,
            @RequestParam double valor,
            @RequestParam String descricao,
            @RequestParam String tipo_pedido,
            RedirectAttributes redirectAttributes
    ) {
        Funcionario funcionario = null;
        Usuario usuario = null;

        if (funcionarioId != null) {
            funcionario = funcionarioService.buscar(funcionarioId);
            if (funcionario == null) {
                redirectAttributes.addFlashAttribute("msg", "Funcionário inválido.");
                return "redirect:/pedidos";
            }
        }

        if (usuarioId != null) {
            usuario = usuarioService.buscar(usuarioId);
            if (usuario == null) {
                redirectAttributes.addFlashAttribute("msg", "Usuário inválido.");
                return "redirect:/pedidos";
            }
        }

        Pedidos pedido = new Pedidos();
        pedido.setCodigo_pedido(codigo != null ? codigo : 0);
        pedido.setFuncionario(funcionario);
        pedido.setUsuario(usuario);
        pedido.setValor(valor);
        pedido.setDescricao(descricao);
        pedido.setTipo_pedido(tipo_pedido);

        String mensagem;
        if (codigo != null && codigo > 0) {
            mensagem = pedidosService.alterar(pedido);
        } else {
            mensagem = pedidosService.inserir(pedido);
        }

        redirectAttributes.addFlashAttribute("msg", mensagem);
        return "redirect:/pedidos";
    }
}
