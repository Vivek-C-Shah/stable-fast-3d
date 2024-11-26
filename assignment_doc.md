# Documentation for Repository Setup

## **Steps Taken**

1. **Environment Setup:**
   - Created a virtual environment using `virtualenv` to isolate the project dependencies.
   - Installed essential tools like `setuptools` and `wheel` to support dependency installation.

2. **Dependency Management:**
   - Parsed and installed the dependencies from `requirements.txt` file, excluding `gpytoolbox`, which required special handling.
   - Installed `gpytoolbox` separately with custom flags (`--no-build-isolation --no-use-pep517`) to resolve build issues.

3. **Hugging Face Token Configuration:**
   - Provided instructions for obtaining a Hugging Face access token to use the gated model.
   - Automated token input via `huggingface-cli login`.

4. **Cross-Platform Considerations:**
   - Ensured the setup process worked on Linux, macOS, and Windows by adapting commands for compatibility.
   - Used flexible tools like `sed` to process files dynamically during installation.

5. **Automation of Setup:**
   - Combined all steps into a single shell script (`setup.sh`) to minimize user effort and reduce errors during manual installation.

---

## **Challenges Faced**

1. **Dependency Build Issues:**
   - Encountered errors during the installation of `gpytoolbox`, which required a custom build process involving CMake and other system dependencies.
   - Resolved by separating its installation from the main `requirements.txt` and using the correct build flags.

2. **Cross-Platform Compatibility:**
   - Differences in shell utilities (e.g., `sed` behavior on macOS and Linux) required careful handling to ensure consistency.

3. **Hugging Face Authentication:**
   - Guided users on generating and using an access token, as this step could be confusing for first-time users.

4. **Python Version Compatibility:**
   - The repository initially faced issues with Python 3.12. Adjusted dependencies and recommended Python 3.10 for stability.

5. **User Guidance:**
   - Ensuring users understood the steps to resolve access-related issues for Hugging Face gated models.

---

## **Key Lessons Learned**

1. **Dependency Isolation is Crucial:**
   - Using a virtual environment ensured that the project dependencies didn’t interfere with global packages.

2. **Clear Guidance Minimizes Errors:**
   - Providing step-by-step instructions for Hugging Face token setup reduced confusion and increased the likelihood of successful configuration.

3. **Custom Installations Require Extra Care:**
   - Libraries like `gpytoolbox` often need specific build environments or manual intervention, so isolating their setup can prevent broader installation issues.

4. **Automation Saves Time:**
   - Consolidating setup steps into a script minimizes manual errors and creates a consistent installation experience across systems.

5. **Documentation is a Lifesaver:**
   - Clear documentation of challenges and resolutions helps future contributors and maintainers.

---

## **Optimizations and Improvements**

1. **Dependency Installation Workflow:**
   - Separated problematic dependencies (`gpytoolbox`) from the main installation process to streamline the setup.
   - Used `sed` to dynamically modify `requirements.txt` without requiring permanent changes.

2. **Environment Flexibility:**
   - Ensured the script detects and uses the appropriate Python version (`python3` or `python`) and provides feedback if Python is missing.

3. **Hugging Face Integration:**
   - Automated token input and provided clear guidance to simplify user interaction with the Hugging Face platform.

4. **Cross-Platform Support:**
   - Used platform-agnostic commands and ensured compatibility for Linux, macOS, and Windows systems.

5. **User Feedback:**
   - Added meaningful log messages in the setup script to guide users through each step and provide context for any errors.

---

## **Future Considerations**

- **Testing on Multiple Environments:**
  Test the installer script on various platforms and Python versions to identify potential edge cases.
  
- **Dockerization:**
  Consider creating a Docker image to encapsulate the environment and dependencies for a truly portable setup.

- **Windows Batch Script:**
  Add a `.bat` equivalent for Windows users who may not be comfortable with shell scripts.

- **CI/CD Integration:**
  Automate the testing of the installation process in CI pipelines to ensure compatibility after updates.