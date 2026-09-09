<?php
    class BD {
        public static function getConexao() {
            $conn = new PDO(
                "mysql:host=localhost;dbname=kamifister",
                "root",
                "root"
            );

            return $conn;
        }
    }