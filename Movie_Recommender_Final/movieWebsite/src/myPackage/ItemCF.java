package myPackage;

import sun.applet.Main;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Autman on 10/19/16.
 */
public class ItemCF {
    public static String path = "/Users/Autman/IdeaProjects/movieWebsite/movie_metadata.csv";
    //public static String output_path = "C:\\Users\\leocsq\\Desktop\\CPA2\\output";

    public static void main(String[] args){
        System.out.println(similarMovie("avatar"));
    }
    public static String similarMovie(String movieName){

        //String path = "C:\\Users\\tonyc\\IdeaProjects\\Customer Potential Application\\input\\movie_metadata.csv";

//        Scanner in = new Scanner(System.in);
//        System.out.println("please enter a movie:");
//        String movieName = "";
//        while (in.hasNext()){
//            movieName += in.next().trim().replaceAll("[:\\\\/*\"?|<>']", "") + " ";
//        }
        //String movieName = in.nextLine().toLowerCase().replaceAll("[:\\\\/*\"?|<>']", "") ;
        if (movieName == null || movieName.isEmpty()){
            return null;
        }

        movieName = movieName.trim().toLowerCase().replaceAll("[:\\\\/*\"?|<>']", "");
        int inputRow = CSV.findByName(new File(path), movieName);
        //System.out.println(inputRow);
        if (inputRow < 2){
            return null;
        }

        String[] user1 = CSV.readLine(new File(path), inputRow);

        //List<String> dataList = CSV.importCsv(new File(path));

//        if (dataList != null && !dataList.isEmpty()){
//
//            for(String data : dataList){
//                System.out.println(data);
//            }
//        }
//        String[] test = CSV.readLine(new File(path), 4);
//
//        for (int i = 0; i < test.length; i++){
//            System.out.print(test[i]);
//        }
        String movieType = user1[9];
        //System.out.println(movieType);
        List<Integer> relatedMovies = CSV.findLine(new File(path), movieType);

//        for (int i = 0; i < relatedMovies.size(); i++){
//            System.out.println(relatedMovies .get(i));
//        }

        //relatedMovies.remove(relatedMovies)
        List<Integer> newRelatedMovies = removeDuplicates(relatedMovies);
        //System.out.println(newRelatedMovies.indexOf(2));
//        if (newRelatedMovies.indexOf(inputRow) != -1){
//            newRelatedMovies.remove(newRelatedMovies.indexOf(inputRow));
//        }
        newRelatedMovies.remove(newRelatedMovies.indexOf(inputRow));
//        for (int i = 0; i < newRelatedMovies .size(); i++){
//            System.out.println(newRelatedMovies .get(i));
//        }
        if (newRelatedMovies == null || newRelatedMovies.size() == 0){
            return null;
        }

        List<Double> moviesRates = findRates(user1, newRelatedMovies);
//        for (int i = 0; i < moviesRates.size(); i++){
//            System.out.println(moviesRates .get(i));
//        }
        int max = findMax(moviesRates);
        int row = newRelatedMovies.get(max);
        //System.out.println(max);
        //String movieTitle = MySQL.findMovieTitle(row);
        //System.out.println(movieTitle);

//        String[] result = CSV.readLine(new File(path), row);
//        ArrayList<String> results = new ArrayList<String>();
//        for (int i = 0; i < result.length; i++){
//            results.add(result[i]);
//        }

        String result = MySQL.findMovieTitle(row);
        return result;
        //output(result, output_path + "test.txt");
        //System.out.println(result[11]);

    }

    public static List<Integer> removeDuplicates (List<Integer> list){
        HashMap<Integer, Boolean> mp = new HashMap<Integer, Boolean>();
        for (int i = 0; i < list.size(); ++i)
            mp.put(list.get(i), true);

        //int result = 0;
        List<Integer> results = new ArrayList<Integer>();
        for (Map.Entry<Integer, Boolean> entry : mp.entrySet())
            results.add(entry.getKey());
        return results;
    }

    public static List<Double> findRates(String[] user, List<Integer> rows){

        List<Double> rates = new ArrayList<Double>();
        for (int i = 0; i < rows.size(); i++){
            String[] history = CSV.readLine(new File(path), rows.get(i));
            double rate = 0;
            for (int j = 0; j < Math.min(user.length, history.length); j++){
                if (history[j].contains(user[j])){
                    rate++;
                }
            }
            if(history[25] != null && !history[25].isEmpty()) {
                rates.add(rate * Double.parseDouble(history[25]));
            }else{
                rates.add(rate);
            }
        }

        return rates;
    }

    public static int findMax(List<Double> rates){
        double max = 0;
        int index = -1;
        int index2 = 0;
        for (int i = 0; i < rates.size(); i++){
            if (rates.get(i) > max){
                max = rates.get(i);
                index2 = index;
                index = i;
            }
        }
        return index2 >= 0?index2:0;
    }

    public static void output(String[] result, String filename){
        BufferedWriter bufferedWriter = null;

        try {

            //Construct the BufferedWriter object
            bufferedWriter = new BufferedWriter(new FileWriter(filename));

            //Start writing to the output stream
            for (int i = 0; i < result.length; i++){
                bufferedWriter.write(result[i]);
                bufferedWriter.newLine();
            }

        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            //Close the BufferedWriter
            try {
                if (bufferedWriter != null) {
                    bufferedWriter.flush();
                    bufferedWriter.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
