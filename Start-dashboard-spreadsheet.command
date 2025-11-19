#!/bin/bash

# Navigate to the dashboard directory
cd "$(dirname "$0")"

echo "=========================================="
echo "  Starting Billing Dashboard Server"
echo "  (Spreadsheet Edition)"
echo "=========================================="
echo ""
echo "Dashboard will open in your browser at:"
echo "  http://localhost:8000/dashboard-spreadsheet.html"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=========================================="
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    # Open browser after a short delay
    sleep 2 && open "http://localhost:8000/dashboard-spreadsheet.html" &
    
    # Start Python 3 server
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    # Open browser after a short delay
    sleep 2 && open "http://localhost:8000/dashboard-spreadsheet.html" &
    
    # Try Python 2 server
    python -m SimpleHTTPServer 8000
else
    echo "ERROR: Python is not installed."
    echo "Please install Python or use one of the alternative solutions in README.md"
    echo ""
    read -p "Press Enter to close..."
fi

