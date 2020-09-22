package de.d3ns0n;

public class Main {

    public static void main(String[] args) {
        System.out.println("\n" + "Found system properties:");

        System.getProperties().keySet().stream()
                .filter(key -> key.toString().startsWith("-MY_"))
                .forEach(key -> System.out.println(key + " = " + System.getProperty(key.toString())));
    }

}
