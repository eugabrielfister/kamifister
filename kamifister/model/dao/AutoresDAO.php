<?php
    class AutoresDAO {
        public function read() {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM autor");
                

                if(!$query->execute()) {
                    print r($query->errorInfo());
                }

                $listaAutores = array();
                    foreach($query->fetchAll(PDO::FETCH_ASSOC) as $linha) {
                        $autor = new Autor();
                        $autor->setId($linha['id_autor']);
                        $autor->setNome($linha['nome']);
                        $autor->setNacionalidade($linha['nacionalidade']);

                        array_push($listaAutores, $autor);
                    }
                    
                    return $listaAutores;
            
            } 
            catch(PDOException $e) {
                echo "Erro #2: " . $e->getMessage();
            }
            
        }
    }