package ru.gb.spring.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.gb.spring.entities.Student;
import ru.gb.spring.repositories.StudentRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StudentService {
    private final StudentRepository studentRepository;

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public Student getStudentById(Long id) {
        if (id == null) {
            throw new RuntimeException("Invalid parameter");
        }
        return studentRepository.findById(id).orElse(null);
    }

    public void saveNewStudent(Student student) {
        if (student == null) {
            throw new RuntimeException("Invalid parameter");
        }
        studentRepository.save(student);
    }

    public void expelStudentById(Long id) {
        if (id == null) {
            throw new RuntimeException("Invalid parameter");
        }
        studentRepository.deleteById(id);
    }
}
