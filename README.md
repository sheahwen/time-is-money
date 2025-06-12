# Time is Money

A macOS app that helps you visualize your monthly salary earnings in real-time and track your progress towards your financial goals.

## Features

- **Real-time Salary Tracking**: See how much you've earned as you work, updated every second
- **Customizable Work Schedule**:
  - Set your monthly salary
  - Configure your work hours
  - Choose your working days
- **Dream Goals Tracking**:
  - Add your financial goals/dreams
  - Track progress towards your financial goals/dreams
  - Visualize your savings progress
- **Status Bar Integration**:
  - Monitor your earnings directly from the menu bar
  - View progress towards your dreams
  - Quick access to the app

## Requirements

- macOS 14.5 or later
- Xcode 15.0 or later (for development)

## Installation

1. Download the latest release from the [Releases](https://github.com/yourusername/time-is-money/releases) page
2. Move the app to your Applications folder
3. Launch the app
   - Note: You may see a security alert when first launching the app. This is normal for apps downloaded from the internet. To proceed:
     1. Go to System Settings > Privacy & Security
     2. Scroll down to Security
     3. Click "Open Anyway" for the Time is Money app

## Usage

### Setting Up Your Salary

1. Enter your monthly salary
2. Set your work hours (start and end time)
3. Select your working days
4. The app will automatically calculate your earnings per second

### Adding Dreams

1. Click the "+" button to add a new dream
2. Enter the dream name and cost
3. Track your progress towards each dream in real-time

### Status Bar

- Click the dollar sign icon in the menu bar to open the app
- View your current earnings and progress towards dreams
- The status bar updates every second with your latest earnings

## Development

### Building from Source

1. Clone the repository:

```bash
git clone https://github.com/yourusername/time-is-money.git
```

2. Open the project in Xcode:

```bash
cd time-is-money
open Money.xcodeproj
```

3. Build and run the project (⌘R)

### Project Structure

- `Models/`: Contains data models and business logic
  - `Data.swift`: Salary calculations and work schedule management
  - `Dreams.swift`: Dream goals tracking and management
- `Views/`: SwiftUI views
  - `Form.swift`: Salary and work schedule configuration
  - `DreamsForm.swift`: Dream goals management interface
- `ContentView.swift`: Main app interface
- `StatusBarManager.swift`: Menu bar integration
- `AppDelegate.swift`: App lifecycle management

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
