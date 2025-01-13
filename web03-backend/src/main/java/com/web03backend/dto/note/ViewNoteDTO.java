package com.web03backend.dto.note;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ViewNoteDTO {
    private Long id;
    private String note;
    private LocalDateTime createdAt;
}
