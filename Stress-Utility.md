The **`stress`** command is a Linux tool designed to put the system under stress by generating high CPU, memory, I/O, or disk usage. It's often used for performance testing, stress testing, or diagnosing hardware issues under load.

---

### **Installing `stress`**
For most Linux distributions, you can install it using the package manager:

- **Ubuntu/Debian**:  
  ```bash
  sudo apt update && sudo apt install stress
  ```

- **RHEL/CentOS**:  
  ```bash
  sudo yum install epel-release
  sudo yum install stress
  ```

---

### **Basic Usage**
Run `stress` with options to specify the type and level of stress you want to induce.

#### Common Options:
| Option              | Description                                     |
|---------------------|-------------------------------------------------|
| `-c <N>`            | Stress with `<N>` CPU workers                   |
| `-m <N>`            | Stress with `<N>` memory workers                |
| `--vm-bytes <SIZE>` | Allocate `<SIZE>` of memory per VM worker       |
| `-i <N>`            | Stress with `<N>` I/O workers                   |
| `-d <N>`            | Stress with `<N>` disk workers                  |
| `-t <TIME>`         | Run stress test for `<TIME>` seconds            |

---

### **Examples**
1. **CPU Stress Test**:  
   Run 4 CPU workers indefinitely:  
   ```bash
   stress -c 4
   ```

2. **Memory Stress Test**:  
   Allocate 1GB of memory using 2 workers:  
   ```bash
   stress -m 2 --vm-bytes 1G
   ```
