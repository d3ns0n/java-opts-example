package de.d3ns0n;

public class Main {

    public static void main(String[] args) {
        System.out.println("\n" + "Java app started");

        System.getProperties().keySet().stream()
                .filter(key -> key.toString().startsWith("-MY_"))
                .forEach(key -> System.out.println(key + " = " + System.getProperty(key.toString())));
    }

}
