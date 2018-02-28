package by.epam.project.hostel.controller.img.loader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;

public class ImgLoader {
    private static final String IMAGE_MIME_TYPE = "image/";
    private static final String FILE = "file";


    private ImgLoader() {
    }


    public static String getImgPath(HttpServletRequest request, String pictureUploadPath) throws IOException, ServletException {
        Part filePart = request.getPart(FILE);
        String filename = filePart.getSubmittedFileName();
        if (!filename.isEmpty()) {
            String mimeType = request.getServletContext().getMimeType(filename);
            if (mimeType.startsWith(IMAGE_MIME_TYPE)) {
                File uploads = new File(request.getServletContext().getRealPath("") + pictureUploadPath);
                File file = new File(uploads, filename);
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
            }
        }
        return filename.isEmpty() ? null : pictureUploadPath + LocalDateTime.now().toString() + filename;
    }

}
