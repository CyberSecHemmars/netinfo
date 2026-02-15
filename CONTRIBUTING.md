# Contributing to netinfo

Thank you for your interest in contributing to netinfo! 🎉

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- Your OS and version
- Python version
- Steps to reproduce
- Expected vs actual behavior
- Any error messages

### Suggesting Features

Feature requests are welcome! Please:
- Check existing issues first
- Explain the use case
- Describe the expected behavior

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly on your system
5. Commit with clear messages (`git commit -m 'Add amazing feature'`)
6. Push to your fork (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Code Style

- Follow PEP 8 for Python code
- Use type hints where appropriate
- Add comments for complex logic
- Keep functions focused and small
- Maintain the clean, readable output format

### Testing

Before submitting:
- Test on a real Linux system
- Test with and without colors (`--no-color`)
- Test with IPv6 flag (`--ipv6`)
- Verify WiFi SSID detection works (if applicable)
- Check edge cases (no interfaces, down interfaces, etc.)

### Documentation

- Update README.md if adding features
- Add examples of new functionality
- Update help text if adding options
- Comment complex code sections

## Development Setup

```bash
git clone https://github.com/CyberSecHemmars/netinfo.git
cd netinfo
chmod +x netinfo
./netinfo  # Test it out
```

## Questions?

Feel free to open an issue for any questions or clarifications!

## Code of Conduct

Be respectful, constructive, and kind to other contributors.
