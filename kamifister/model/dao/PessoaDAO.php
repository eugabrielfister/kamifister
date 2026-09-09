<?php
    class PessoaDAO {
        public function read() {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM pessoa");
                

                if(!$query->execute()) {
                    print r($query->errorInfo());
                }

                $listaPessoas = array();
                    foreach($query->fetchAll(PDO::FETCH_ASSOC) as $linha) {
                        $pessoa = new Pessoa();
                        $pessoa->setId($linha['id_pessoa']);
                        $pessoa->setNome($linha['nome']);
                        $pessoa->setTelefone($linha['telefone']);

                        array_push($listaPessoas, $pessoa);
                    }
                
                    return $listaPessoas;
            
            } 
            catch(PDOException $e) {
                echo "Erro #2: " . $e->getMessage();
            }
            
        }
    }