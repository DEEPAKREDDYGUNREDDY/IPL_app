package com.example.RCB_FanPage.runner;

import com.example.RCB_FanPage.service.IplImportService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class DataImportRunner implements CommandLineRunner {

    private final IplImportService importService;
    private final Environment env;

    public DataImportRunner(IplImportService importService, Environment env) {
        this.importService = importService;
        this.env = env;
    }

    @Override
    public void run(String... args) {
        String path = env.getProperty("app.ipl.data-path");
        if (path == null || path.isBlank()) {
            System.out.println("app.ipl.data-path not set. Skipping IPL import.");
            return;
        }

        boolean enabled = Boolean.parseBoolean(env.getProperty("app.ipl.import-enabled", "false"));
        if (!enabled) {
            System.out.println("IPL import disabled (set app.ipl.import-enabled=true to import).");
            return;
        }

        importService.importAll(path);
    }
}
