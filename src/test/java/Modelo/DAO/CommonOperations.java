/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import static com.ninja_squad.dbsetup.Operations.deleteAllFrom;
import static com.ninja_squad.dbsetup.Operations.insertInto;
import static com.ninja_squad.dbsetup.Operations.sequenceOf;
import static com.ninja_squad.dbsetup.Operations.sql;
import com.ninja_squad.dbsetup.generator.ValueGenerators;
import com.ninja_squad.dbsetup.operation.Operation;

/**
 *
 * @author raphael
 */
public class CommonOperations {

    public static final Operation DELETE_ALL
            = deleteAllFrom("usuario_tem_papel", "usuario");

    public static final Operation RESET_AUTOINCREMENT_MYSQL
            = sql("ALTER TABLE usuario AUTO_INCREMENT = 1");

    public static final Operation RESET_AUTOINCREMENT_MYSQL2
            = sql("ALTER TABLE categoria AUTO_INCREMENT = 1");

    public static final Operation RESET_AUTOINCREMENT_MYSQL3
            = sql("ALTER TABLE questao AUTO_INCREMENT = 1");

    public static final Operation RESET_AUTOINCREMENT_MYSQL4
            = sql("ALTER TABLE alternativa AUTO_INCREMENT = 1");
    
    public static final Operation RESET_AUTOINCREMENT_MYSQL5
            = sql("ALTER TABLE Prova AUTO_INCREMENT = 1");

    public static final Operation INSERE_DADOS_BASICOS
            = sequenceOf(
                    insertInto("usuario")
                            .columns("nome", "login", "senha", "email")
                            .values("Grosbilda", "Seilah", " 222", "grosbilda@seilah.com")
                            .values("Estrobilobaldo", "Seilah2", "333", "estrobilobaldo@seilah.com")
                            .values("Zirgonisvaldo", "Seilah3", "444", "zirgonisvaldo@seilah.com")
                            .build());
    public static final Operation INSERE_DADOS_BASICOS2
            = sequenceOf(
                    insertInto("categoria")
                            .columns("nome", "descricao", "codigo_usuario")
                            .values("Categoria_Grosbilda", "Seilah", 1)
                            .values("Categoria_Estrobilobaldo", "Seilah2", 2)
                            .values("Categoria_Zirgonisvaldo", "Seilah3", 3)
                            .build());

    public static final Operation INSERE_DADOS_BASICOS3
            = sequenceOf(
                    insertInto("questao")
                            .columns("pergunta", "descricao", "codigo_categoria", "codigo_usuario")
                            .values("teadkajjsd", "sdfjskdjfio", 1, 1)
                            .values("fghfghfghfh", "sdjfsodsdf", 1, 1)
                            .values("rtgdfdbcvbvb", "krwewefssfd", 1, 1)
                            .values("dfgdfnfnisdfs", "cvbedfert", 1, 1)
                             
                            .build());

    public static final Operation INSERE_DADOS_BASICOS4
            = sequenceOf(
                    insertInto("alternativa")
                            .columns("alternativa", "codigo_questao", "valor")
                            .values("teadkajjsdd", 1, 0)
                            .values("fghfghfghfh", 1, 0)
                            .values("rtgdfdbcvbvb", 1, 0)
                            .values("dfgdfnfnisdfs", 1, 1)
                            .values("teadkajjsdd", 2, 0)
                            .values("fghfghfghfh", 2, 1)
                            .values("rtgdfdbcvbvb", 2, 0)
                            .values("dfgdfnfnisdfs", 2, 0)
                            .values("teadkajjsdd", 3, 0)
                            .values("fghfghfghfh", 3, 0)
                            .values("rtgdfdbcvbvb", 3, 1)
                            .values("dfgdfnfnisdfs", 3, 0)
                            .build());
    
    public static final Operation INSERE_DADOS_BASICOS5
            = sequenceOf(
                    insertInto("Prova")
                            .columns("codigo_usuario", "data_cri", "nmq", "categorias")
                            .values(1, "10/12/2017", 4,"Categoria_Grosbilda")
                            
                            .build());
    public static final Operation INSERE_DADOS_BASICOS6
            = sequenceOf(
                    insertInto("prova_questao")
                            .columns("codigo_prova", "codigo_questao")
                            .values(1,1)
                            .values(1,2)
                            .values(1,3)
                          
                            .build());

    public static final Operation INSERE_DADOS_BASICOS_IDS_ESPECIFICOS
            = sequenceOf(
                    insertInto("usuario")
                            .withGeneratedValue("codigo",
                                    ValueGenerators.sequence().startingAt(1).incrementingBy(1))
                            .columns("nome", "login", "senha", "email")
                            .values("Grosbilda", "Seilah", " 222", "grosbilda@seilah.com")
                            .values("Estrobilobaldo", "Seilah2", "333", "estrobilobaldo@seilah.com")
                            .values("Zirgonisvaldo", "Seilah3", "444", "zirgonisvaldo@seilah.com")
                            .build());

    private CommonOperations() {

    }
}
