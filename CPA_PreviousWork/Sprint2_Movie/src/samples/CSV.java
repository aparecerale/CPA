package samples;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CSV {

    public static List<String> importCsv(File file) {
        List<String> dataList = new ArrayList<String>();

        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String line = "";
            while ((line = br.readLine()) != null) {
                dataList.add(line);
            }
        } catch (Exception e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                    br = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return dataList;
    }

    public static String[] readLine(File file, int row){
        BufferedReader br = null;
        //String line = "";
        try {
            br = new BufferedReader(new FileReader(file));
            String line = "";
            if (row > 5044){
                return null;
            }
            for (int i = 0; i < row; i++){
                line = br.readLine();
            }

            return line.split(",");
        } catch (Exception e) {
            System.out.println("readLine error");
        }finally {
            if (br != null) {
                try {
                    br.close();
                    br = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return null;
    }

    public static List<Integer> findLine(File file, String element){
        if (element == null){
            return null;
        }
        int row = 1;
        List<Integer> rows = new ArrayList<Integer>();

        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String line = "";
            while ((line = br.readLine()) != null) {
                String[] elements = line.split(",");
                for (int i = 0; i < elements.length; i++){
                    if (elements[i].indexOf(element) != -1 && row != 1){
                        rows.add(row);
                    }
                }
                row++;
            }
        } catch (Exception e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                    br = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return rows;
    }

    public static int findByName(File file, String name){
        List<String> movieNames = new ArrayList<String>();
        int row = 0;
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String line = "";
            while ((line = br.readLine()) != null) {
                String[] elements = line.split(",");
                movieNames.add(elements[11].trim().toLowerCase().replaceAll("\\u00A0","").replaceAll("[:\\\\/*\"?|<>']", ""));
            }

            //System.out.println(movieNames.get(1).charAt(6) - 'A');
            row = movieNames.indexOf(name);

//            if (row < 1){
//                throw new NoSuchElementException();
//            }
        } catch (Exception e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                    br = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

//        for (int j = 0; j < movieNames.size(); j++){
//            System.out.println(movieNames.get(j));
//        }
        //System.out.println(row);
        //System.out.println(name);
        //System.out.println(movieNames.get(1));
//        if (row < 1){
//            throw new NoSuchElementException();
//        }
        return row + 1;
    }
}