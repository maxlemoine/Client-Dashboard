# Customer Billing Dashboard

A simple, beautiful web dashboard to track Deepgram customer billing, credits, and usage.

## Features

- 📊 Track multiple customer projects simultaneously
- 💰 Monitor current balance and contracted amounts
- 📉 View burn rate and projected days until credits run out
- 🎨 Color-coded status indicators (Green/Yellow/Red)
- 🔄 Auto-refresh every 5 minutes (optional)
- 🔐 Secure local storage of API credentials

## ⚠️ Important: How to Run the Dashboard

**Don't just double-click the HTML file!** It will cause a "Failed to fetch" error due to browser security restrictions.

**Instead, do this:**
1. Go to the `billing-dashboard` folder in Finder
2. **Double-click `start-dashboard.command`** to launch the dashboard properly
3. If prompted by macOS, click "Open" to allow it to run
4. Your dashboard will open automatically in your browser

Keep the terminal window open while using the dashboard. Press `Ctrl+C` to stop when done.

---

## Quick Start

### Step 1: Get Your API Key

1. Log into your Deepgram account
2. Navigate to your API keys section
3. Create a new API key with read permissions (or use an existing one)
4. Copy the API key - you'll need it in Step 3

### Step 2: Gather Your Project IDs

1. In Deepgram, navigate to each customer project
2. Copy the project ID (usually visible in the URL or project settings)
3. Make a list of all project IDs you want to monitor

### Step 3: Open the Dashboard

1. **Open the dashboard**: Double-click the `dashboard.html` file
   - It will open in your default web browser
   - **Note**: Chrome/Edge/Safari recommended for best experience

2. **Click the "Settings" button** in the top right

3. **Enter your credentials**:
   - **Deepgram API Key**: Paste your API key
   - **Authorization Scheme**: Select how your API key should be sent (Token, Bearer, API-Key, or Custom)
   - **Custom Header Name** (if Custom selected): Enter the header name (e.g., `X-API-Key`)
   - **Project IDs**: Enter one project ID per line
   - **Project Names** (optional): Enter friendly names for each project (one per line, matching the order of project IDs)

4. **Click "Save & Reload"**

That's it! Your dashboard will now load and display all your customer billing information.

## Authorization Schemes

The dashboard supports multiple authorization methods to work with different API configurations:

- **Token (default)**: Sends `Authorization: Token YOUR_API_KEY` - Standard Deepgram format
- **Bearer**: Sends `Authorization: Bearer YOUR_API_KEY` - Common for OAuth and JWT tokens
- **API-Key**: Sends `Authorization: API-Key YOUR_API_KEY` - Alternative API key format
- **Custom Header**: Allows you to specify a custom header name
  - With custom header name: Sends `X-Your-Header: YOUR_API_KEY`
  - Without custom header name: Sends `Authorization: YOUR_API_KEY` (raw value)

**When to use Custom Header:**
- Your API requires a non-standard authorization header (e.g., `X-API-Key`, `X-Auth-Token`)
- Your API key format includes the scheme already (e.g., `Bearer abc123`)
- You need to match a specific authentication requirement

## Dashboard Metrics

Each customer card displays:

- **Contracted Amount**: Total prepaid credits purchased
- **Current Balance**: Remaining credits available
- **Total Usage (30d)**: Credits consumed in the last 30 days
- **Burn Rate**: Average daily credit consumption
- **Days Until Empty**: Projected days until credits run out
- **Projected Empty Date**: Estimated date when credits will be depleted

## Color Coding

- 🟢 **Green (Healthy)**: 0-60% credits used
- 🟡 **Yellow (Warning)**: 60-80% credits used
- 🔴 **Red (Critical)**: 80-100% credits used

## Features

### Auto-Refresh

Enable the "Auto-refresh (5 min)" checkbox to automatically reload data every 5 minutes. Perfect for leaving the dashboard open and monitoring in real-time.

### Manual Refresh

Click the "Refresh Data" button at any time to manually reload the latest information.

### Security

- Your API key is stored securely in your browser's local storage
- Data never leaves your computer except to make API calls to Deepgram
- No external services or analytics are used

## Customization

### Adding New Metrics

The dashboard is designed to be easily extensible. To add new metrics:

1. Open `dashboard.html` in a text editor
2. Find the `calculateMetrics()` function (around line 440)
3. Add your new calculation
4. Find the `renderDashboard()` function (around line 490)
5. Add a new metric display block following the existing pattern

Example:

```html
<div class="metric">
    <span class="metric-label">Your New Metric</span>
    <span class="metric-value">${project.metrics.yourNewMetric}</span>
</div>
```

### Changing Color Thresholds

To adjust when colors change (currently 60% and 80%):

1. Open `dashboard.html` in a text editor
2. Find the `getStatus()` function (around line 470)
3. Adjust the percentage thresholds:

```javascript
function getStatus(usagePercent) {
    if (usagePercent < 60) return 'healthy';  // Change 60 to your preference
    if (usagePercent < 80) return 'warning';  // Change 80 to your preference
    return 'critical';
}
```

## Troubleshooting

### "Failed to fetch" Error (Most Common Issue)

This error occurs when opening the HTML file directly from your file system due to browser CORS restrictions.

**SOLUTION - Use the Launch Script (Easiest):**

1. In Finder, go to the `billing-dashboard` folder
2. **Double-click `start-dashboard.command`**
3. If prompted, click "Open" to allow the script to run
4. The dashboard will automatically open in your browser
5. The terminal window will stay open - **don't close it** while using the dashboard
6. Press `Ctrl+C` in the terminal to stop the server when done

**Alternative Solutions:**

**Option A - Use Terminal:**
```bash
cd ~/billing-dashboard
python3 -m http.server 8000
```
Then open: http://localhost:8000/dashboard.html

**Option B - Use a different browser:**
- Some browsers like Firefox may have less strict CORS policies for local files
- Try opening the HTML file in different browsers

**Option C - Disable CORS (Chrome - Temporary, for testing only):**
1. Close ALL Chrome windows completely
2. Open Terminal and run:
   ```bash
   open -na "Google Chrome" --args --disable-web-security --user-data-dir="/tmp/chrome_dev"
   ```
3. Open the dashboard.html file
4. **⚠️ Only use this for testing, not regular browsing**

### Dashboard shows "Please configure your API key..."

- Click Settings and ensure you've entered your API key and at least one project ID
- Click "Save & Reload"

### Error loading projects

- **401 Unauthorized**: Check that your API key is correct and has the necessary permissions
- **403 Forbidden**: Your API key may not have access to the specified project
- **404 Not Found**: Verify that your project IDs are correct
- **Network Error**: Check your internet connection
- **Failed to fetch**: See "Failed to fetch" section above

### No data showing

- Make sure the project has balances and usage data
- Try refreshing the dashboard
- Check the browser console (F12) for detailed error messages

### Dashboard looks broken

- Make sure you're using a modern browser (Chrome, Firefox, Safari, Edge)
- Try clearing your browser cache
- Make sure JavaScript is enabled

## Data Source

The dashboard uses the following Deepgram API endpoints:

- `/v1/projects/:project_id/balances` - Get current balances
- `/v1/projects/:project_id/usage/breakdown` - Get usage data (last 30 days)

## Support

For issues with:
- **The dashboard**: Check the troubleshooting section above
- **Deepgram API**: Contact Deepgram support
- **API permissions**: Verify your API key has read access to projects

## Tips

1. **Bookmark the dashboard**: Add it to your bookmarks for quick access
2. **Use descriptive names**: Give your projects clear names in Settings for easier identification
3. **Regular monitoring**: Check the dashboard daily to catch issues before credits run out
4. **Export data**: Use your browser's print function (Ctrl/Cmd+P) to save a PDF snapshot

## Privacy & Security

- All data is processed locally in your browser
- Your API key is stored in browser localStorage (not in cookies)
- No analytics or tracking is performed
- No data is sent to third parties

## Requirements

- Modern web browser (Chrome, Firefox, Safari, or Edge)
- Internet connection (to fetch data from Deepgram API)
- Valid Deepgram API key with project read permissions

## License

This dashboard is provided as-is for your use. Feel free to modify it to suit your needs!

---

**Need help?** Open the `dashboard.html` file in a text editor to customize or troubleshoot.
