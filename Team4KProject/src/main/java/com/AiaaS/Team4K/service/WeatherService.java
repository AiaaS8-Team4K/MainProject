package com.AiaaS.Team4K.service;

import org.springframework.stereotype.Service;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;

import org.springframework.stereotype.Service;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class WeatherService {
	
	public List<Double> readEmissionData(String filePath) throws IOException, CsvValidationException {
        List<Double> emissions = new ArrayList<>();
        try (CSVReader reader = new CSVReader(new FileReader(filePath))) {
            String[] line;
            while ((line = reader.readNext()) != null) {
                try {
                    emissions.add(Double.parseDouble(line[3])); // 3번째 열이 배출량 데이터라고 가정
                } catch (NumberFormatException e) {
                    System.err.println("데이터 변환 오류: " + e.getMessage());
                }
            }
        }
        return emissions;
    }
    
    public List<Double> normalizeData(List<Double> data) {
        double max = data.stream().max(Double::compare).orElse(1.0);
        double min = data.stream().min(Double::compare).orElse(0.0);
        
        List<Double> normalizedData = new ArrayList<>();
        for (Double value : data) {
            double normalizedValue = (value - min) / (max - min);
            normalizedData.add(normalizedValue);
        }
        return normalizedData;
    }
}
