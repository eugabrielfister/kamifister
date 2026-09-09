<?php
    class EditorasDAO {
        public function read() {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM editora");
                

                if(!$query->execute()) {
                    print r($query->errorInfo());
                }

                $listaEditoras = array();
                    foreach($query->fetchAll(PDO::FETCH_ASSOC) as $linha) {
                        $editora = new Editora();
                        $editora->setId($linha['id_editora']);
                        $editora->setNome($linha['nome']);
                        array_push($listaEditoras, $editora);
                    }
                    
                    return $listaEditoras;
            
            } 
            catch(PDOException $e) {
                echo "Erro #2: " . $e->getMessage();
            }
            
        }
    }