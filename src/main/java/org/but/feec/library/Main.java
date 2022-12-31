package org.but.feec.library;

import org.but.feec.library.config.DataSourceConfig;

public class Main {
    public static void main(String[] args) {
        if (args != null && args.length > 0) {
            DataSourceConfig.initializeDataSource(args[0]);
        } else {
            DataSourceConfig.initializeDataSource(null);
        }
        App.main(args);
    }
}