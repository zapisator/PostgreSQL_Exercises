import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.Locale;

public class FileWriterByNames {

  public static void main(String[] args) {
    final String[] basicNames = ("    Find the upward recommendation chain for member ID 27\n"
        + "    Find the downward recommendation chain for member ID 1\n"
        + "    Produce a CTE that can return the upward recommendation chain for any member\n")
        .split("\n");
    final String userDir = System.getProperty("user.dir");
    final String localPath = "/src/main/resources/";
    final String concreteDir = "recursive_queries";

    Arrays.stream(basicNames)
        .map(s -> s
            .toLowerCase(Locale.ROOT)
            .trim()
            .replaceAll("[^\\w| ]", "")
            .replace(" ", "_")
        ).forEach(s -> {
          try {
            Files.createFile((Path.of(userDir + localPath + "/" + concreteDir + "/" + s + ".sql")));
          } catch (IOException e) {
            e.printStackTrace();
          }
        });
  }
}
