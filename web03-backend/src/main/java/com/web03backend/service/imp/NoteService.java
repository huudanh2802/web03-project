package com.web03backend.service.imp;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web03backend.domain.NoteEntity;
import com.web03backend.domain.UserEntity;
import com.web03backend.dto.note.UpdateNoteDTO;
import com.web03backend.repositories.spec.INoteRepository;
import com.web03backend.repositories.spec.IUserRepository;
import com.web03backend.service.spec.INoteService;

@Service
public class NoteService implements INoteService {
    @Autowired
    private INoteRepository noteRepository;
    @Autowired
    private IUserRepository userRepository;

    @Transactional(readOnly = true)

    public Page<NoteEntity> findByUserIdAndNoteContainingIgnoreCase(Long userId, String keyword, Pageable pageable) {
        if (keyword == null || keyword.isEmpty()) {

            return noteRepository.findByUserId(userId, pageable);
        }
        return noteRepository.findByUserIdAndNoteContainingIgnoreCase(userId, keyword, pageable);
    }

    @Override
    public NoteEntity createNoteByUserId(Long userId) {
        Optional<UserEntity> user = userRepository.findById(userId);
        if (user.isEmpty()) {
            throw new RuntimeException("User not found");
        }
        NoteEntity note = new NoteEntity(user.get());
        return noteRepository.save(note);
    }

    @Override
    public NoteEntity updateNote(UpdateNoteDTO noteDTO) {
        Optional<NoteEntity> note = noteRepository.findById(noteDTO.getId());
        if (note.isEmpty()) {
            throw new RuntimeException("Note not found");
        }
        note.get().setNote(noteDTO.getNote());
        return noteRepository.save(note.get());
    }

    @Override
    public void deleteNoteById(Long noteId) {
        Optional<NoteEntity> note = noteRepository.findById(noteId);
        if (note.isEmpty()) {
            throw new RuntimeException("Note not found");
        }
        noteRepository.deleteById(noteId);
    }

    @Override
    @Transactional
    public void deleteAllNotesByUserId(Long userId) {
        Optional<UserEntity> user = userRepository.findById(userId);
        if (user.isEmpty()) {
            throw new RuntimeException("User not found");
        }
        noteRepository.deleteByUserId(userId);
    }
}
