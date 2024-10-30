Reference Link - https://www.jenkins.io/doc/book/installing/linux/

Commands

```
sudo apt update

sudo apt install openjdk-17-jre-headless
or
sudo apt install fontconfig openjdk-17-jre

java -version
```

output 
```
openjdk version "17.0.8" 2023-07-18
OpenJDK Runtime Environment (build 17.0.8+7-Debian-1deb12u1)
OpenJDK 64-Bit Server VM (build 17.0.8+7-Debian-1deb12u1, mixed mode, sharing)

```



*1.**`sudo apt install fontconfig openjdk-17-jre`**:*
   - This command installs **two packages**:
     - **`fontconfig`**: A package that configures and manages fonts on Linux. It is necessary for applications that need to render fonts, especially graphical ones.
     - **`openjdk-17-jre`**: This is the full Java Runtime Environment (JRE) for OpenJDK 17, which includes everything needed to run Java applications with graphical user interfaces (GUIs), such as Swing and JavaFX. It includes the JRE, fonts, and libraries for GUI applications.

   **Purpose**: This is suitable if you're running Java applications that require a graphical user interface, as it installs the necessary libraries and fonts for such applications.

*2. **`sudo apt install openjdk-17-jre-headless`**:*
   - This installs only the **`openjdk-17-jre-headless`** package, which is a minimal version of the Java Runtime Environment. The "headless" version omits all components needed for GUI applications (such as fonts and graphical libraries).
   
   **Purpose**: It's ideal for running Java applications on servers or systems without a GUI, saving resources and reducing the package size by not including unnecessary graphical libraries.

### Summary:
- **`openjdk-17-jre`**: Includes GUI support, fonts, and graphical libraries.
- **`openjdk-17-jre-headless`**: A minimal, non-GUI version suitable for server environments.

If you are working with headless environments like servers, the `openjdk-17-jre-headless` package is more appropriate. For desktop applications, you’ll need `openjdk-17-jre`.**