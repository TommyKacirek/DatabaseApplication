package org.but.feec.library.services;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.time.Duration;
import java.time.Instant;

import org.but.feec.library.api.LibraryAuthView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.exceptions.ResourceNotFoundException;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.SecretKeyFactory;
import java.math.BigInteger;


import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class AuthService {

    private LibraryRepository libraryRepository;

    public AuthService(LibraryRepository personRepository) {
        this.libraryRepository = personRepository;
    }

    private LibraryAuthView findPersonByEmail(String email) {
        return libraryRepository.findPersonByEmail(email);
    }


    public boolean authenticate(String username, String password) throws NoSuchAlgorithmException, InvalidKeySpecException {

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            return false;
        }
        //String hash = argon2.hash(10,1024,10,password);
        //System.out.println(hash);


        LibraryAuthView libraryAuthView = findPersonByEmail(username);
        if (libraryAuthView == null) {
            throw new ResourceNotFoundException("Provided username is not found.");
        }

        String strSalt = "Plzenvtanku";
        byte[] salt = strSalt.getBytes();
        int iterations = 10;

        PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, iterations, 128);
        SecretKeyFactory skf = SecretKeyFactory.getInstance(PBKDF2_ALGORITHM);
        String hashedPass = toHex(skf.generateSecret(spec).getEncoded());
        String databasePassword = libraryAuthView.getPassword();

        if (!hashedPass.equals(databasePassword)) {
            return false;
        }
        return true;
    }
    private static String toHex(byte[] array) {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if(paddingLength > 0)
            return String.format("%0" + paddingLength + "d", 0) + hex;
        else
            return hex;
    }
    public static final String PBKDF2_ALGORITHM = "PBKDF2WithHmacSHA1";




    }




