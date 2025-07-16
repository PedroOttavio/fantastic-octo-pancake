package br.LojaFrangos;

import br.LojaFrangos.model.Funcionario;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class LojaFrangosSpringApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Funcionario.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(LojaFrangosSpringApplication.class, args);

    }
}

