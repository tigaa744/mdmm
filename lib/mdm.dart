import 'dart:io';
class MdmCheck {
  static String statusMD = "The Status is : ";

  void mdm() {

    // Check if the device is managed by MDM
    if (isManagedByMDM()) {
      // Remove MDM configuration profiles
      removeMDMConfigurationProfiles();

      // Remove MDM enrollment information
      removeMDMEnrollmentInformation();

      // Restart the device
      restartDevice();
      statusMD = "MDM has been successfully removed from this device.";
      print("MDM has been successfully removed from this device.");
    } else {
      statusMD = "This device is not managed by MDM.";

      print("This device is not managed by MDM.");
    }
  }

// Function to check if the device is managed by MDM
  bool isManagedByMDM() {
    ProcessResult result = Process.runSync(
        'profiles', ['status', '-type', 'enrollment']);
    return result.stdout.toString().contains('MDM');
  }

// Function to remove MDM configuration profiles
  void removeMDMConfigurationProfiles() {
    Process.runSync('profiles', ['remove', '-all']);
  }

// Function to remove MDM enrollment information
  void removeMDMEnrollmentInformation() {
    Process.runSync(
        'sudo', ['profiles', 'remove', '-identifier', 'com.apple.mdm']);
  }

// Function to restart the device
  void restartDevice() {
    Process.runSync('sudo', ['reboot']);
  }
}