/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outros;

import java.util.Scanner;
import org.apache.shiro.authc.credential.DefaultPasswordService;
import org.apache.shiro.crypto.hash.DefaultHashService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.util.SimpleByteSource;

/**
 *
 * @author raphael
 */

public class Encrypt {
    private static final int HASH_ITERATIONS = 500000;
    // Same salt as in shiro.ini, but NOT base64-encoded.
    private static final String PRIVATE_SALT = "b90b7fa5";

    public static String criarHash(String password) {
        DefaultHashService hashService = new DefaultHashService();
        hashService.setHashIterations(HASH_ITERATIONS);
        hashService.setHashAlgorithmName(Sha256Hash.ALGORITHM_NAME);
        hashService.setPrivateSalt(new SimpleByteSource(PRIVATE_SALT)); 
        hashService.setGeneratePublicSalt(true);  //documentação diz que é desnecessário
        DefaultPasswordService passwordService = new DefaultPasswordService();
        passwordService.setHashService(hashService);
       
        String encryptedPassword = passwordService.encryptPassword(password);
        /*System.out.println("Algoritmo usado: " + hashService.getHashAlgorithmName());
        System.out.println("Número de iterações usado: " + hashService.getHashIterations());
        System.out.println("Está usando SALT público: " + (hashService.isGeneratePublicSalt()?"sim":"não"));
        System.out.println("SALT privado em Base64\n" + hashService.getPrivateSalt());
        System.out.println("Hash da senha com SALT aleatório e SALT privado no formato do Apache Shiro\n" + encryptedPassword);*/
        
        return encryptedPassword;
    }
}
