import javax.sound.sampled.Line;
import java.util.ArrayList;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

class Main {
    public static void main(String[] args)
        throws IOException
    {
        List<String> InitialState = new ArrayList<String>();
        Set<String> SetOfStates = new HashSet<String>();
        Set<String> Alphabet = new HashSet<String>();
        List<String> Transitions = new ArrayList<String>();
        List<String> FinalStates = new ArrayList<String>();

        BufferedReader bf = new BufferedReader(new FileReader("C:\\Users\\Alex\\Desktop\\LimbajeFormale\\lab3\\file.csv"));
        String line = bf.readLine();
        while(line != null) {
            //if (line.contains("final")
            if(line.startsWith("q")){
                String []words = line.split(",");
                SetOfStates.add(words[0]);
                Alphabet.add(words[1]);
                Alphabet.remove("initial");
                Alphabet.remove("final");
            }
            if(line.contains("final")){
                String []words = line.split(",");
                FinalStates.add(words[0]);
            }
            if((!line.contains("final"))&&(!line.contains("initial"))){
                Transitions.add(line);
            }
            if(line.contains(("initial"))){
                InitialState.add(line);
            }
            line=bf.readLine();
        }
        bf.close();

        System.out.println("======================INITIAL STATE===========================");
        System.out.println(InitialState);
        System.out.println("==================SET OF STATES=======================");
        System.out.println(SetOfStates);
        System.out.println("=====================ALPHABET=========================");
        System.out.println(Alphabet);
        System.out.println("=====================TRANSITIONS=========================");
        System.out.println(Transitions);
        System.out.println("====================FINAL STATES=========================");
        System.out.println(FinalStates);

    }
}
