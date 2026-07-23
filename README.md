# Bash Absolute Mastery: From Man Page to Production

A comprehensive, mastery-level course detailing the GNU Bourne-Again SHell (Bash 5.1). 
This course is structured to take you from **zero scripting knowledge** to a **production-level automation expert** by translating the dense `man bash` manual into clear, educational materials, real-life examples, practical hands-on labs, and custom bioinformatics applications.

---

## 🗺️ Course Syllabus

| Module | Topic | Est. Duration | Description |
| :--- | :--- | :--- | :--- |
| **Module 1** | [The Shell Environment & Invocation](_lectures/module_01_invocation/01_what_is_bash.md) | 4 Hours | Login vs. non-login shells, interactive vs. non-interactive shells, startup profile configurations. |
| **Module 2** | [Shell Grammar & Basic Execution](_lectures/module_02_grammar/01_invocation_startup.md) | 6 Hours | Simple commands, pipelines (`|`), background jobs (`&`), logical separators (`&&`, `||`), quoting rules. |
| **Module 3** | [Data Handling (Variables & Arrays)](_lectures/module_03_data_handling/01_variables_env.md) | 8 Hours | Positional parameters, special variables, indexed & associative arrays, nameref referencing. |
| **Module 4** | [The Logic Engine (Control Flow)](_lectures/module_04_logic_engine/01_conditional_expressions.md) | 8 Hours | Double-bracket logic (`[[ ]]`), conditional expressions, `case` statements, and loop controls. |
| **Module 5** | [The Expansion Magic](_lectures/module_03_data_handling/04_parameter_expansion.md) | 8 Hours | The 7 expansion steps: brace, tilde, parameter substring and replacement, glob patterns. |
| **Module 6** | [Redirection & Stream Manipulation](_lectures/module_06_redirection/01_io_redirection.md) | 8 Hours | Redirecting descriptors (`<`, `>`, `2>`), Here-documents, Here-strings, stream routing. |
| **Module 7** | [Functions & Script Architecture](_lectures/module_05_functions_builtins/03_script_structure_best_practices.md) | 6 Hours | Defining functions, local scopes, exit codes, traps, and safety configurations (`set -euo pipefail`). |
| **Module 8** | [Advanced System & Process Control](_lectures/module_06_redirection/03_job_control.md) | 8 Hours | Job control (`jobs`, `fg`, `bg`), process synchronization (`wait`), signals and trapping errors. |
| **Module 9** | [🧬 Specialization: Bash for Bioinformatics](_lectures/module_07_bioinformatics/02_bioinformatics_case_studies.md) | 10 Hours | Custom sequence data parsing (FASTA, FASTQ, VCF), pipeline automation, cluster environment submissions. |

---

## 📂 Repository Layout

```text
bash-mastery-course/
├── .github/workflows/         # CI Linting workflows (ShellCheck)
├── README.md                   # Core Course Syllabus & Quick Start Guide
├── LICENSE                     # MIT License file
├── .gitignore                  # Git untracked items reference
│
├── 📚_lectures/                # In-depth theoretical lecture modules & presentations
│   ├── module_01_invocation/
│   ├── module_02_grammar/
│   └── ... (modules 1-7)
│
├── 🛠️_practicals/              # Practical guided labs (starter scripts, solutions, guides)
│   ├── mod_01_env_audit/
│   ├── mod_02_pipeline_architect/
│   └── ... (practicals 1-9)
│
├── 📝_exercises/               # Independent exercise problems and target solutions
│   ├── mod_01_custom_rc/
│   ├── mod_02_logic_handlers/
│   └── ... (exercises 1-9)
│
├── 🧬_bioinformatics/          # Bioinformatics specialized use cases & sample genomics files
│   ├── use_cases.md            # Detailed genomics pipeline notes
│   └── data_samples/           # Dummy fastq, fasta, and vcf sequence files
│
└── 📜_cheatsheets/             # Concise reference guides based on the 'man bash' manual
    ├── expansions_matrix.md    # Param expansions quick reference
    ├── redirection_map.md      # I/O redirection maps
    └── builtin_reference.md    # Shell options and built-ins summaries
```

---

## 🚀 How to Run the Practicals

Every practical folder in `_practicals/` comes with:
1.  `starter_script.sh`: A template containing `TODO` blocks. Open this file and try to implement it yourself.
2.  `solution.sh`: The completed, fully commented reference script.
3.  `walkthrough.md`: A detailed walkthrough explaining each coding step.

To execute a script, make it executable and run it:
```bash
chmod +x starter_script.sh
./starter_script.sh
```

---

## 🛠️ Prerequisites & Linting

We enforce clean, POSIX-compliant scripting conventions.
To check your code for formatting and safety bugs, we recommend installing `shellcheck` depending on your Linux distribution:
```bash
# On Debian/Ubuntu (APT):
sudo apt install shellcheck

# On Fedora/RHEL/CentOS (DNF/YUM):
sudo dnf install shellcheck

# On Arch Linux (Pacman):
sudo pacman -S shellcheck

# Lint your script:
shellcheck solution.sh
```

---

## 📖 Reference Manual

This course matches the complete `man bash` manual page version 5.1.
You can read the original technical reference document on your system at:
*   [Full Bash Manual (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)

---
*Created by Ahmed A. El Hosseiny - 2026*
