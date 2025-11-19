# 📊 Billing Dashboard - Spreadsheet Edition

## ✨ What's New?

This version is **much simpler** and perfect for you! No API keys needed, no CORS issues, just import your data and go.

## 🚀 How to Start

1. **Double-click:** `start-dashboard-spreadsheet.command`
2. Your browser will open automatically
3. That's it!

## 📥 First Time Setup

### Step 1: Prepare Your Data

Your spreadsheet should have these columns:

| Column Name | Example | Notes |
|------------|---------|-------|
| **Project ID** | proj-abc123 | Unique identifier |
| **Company Name** | Acme Corporation | Customer name |
| **ARR** | 50000 | Annual Recurring Revenue |
| **Total Credits** | 100000 | Total prepaid credits purchased |
| **SFDC Link** | https://salesforce.com/... | Link to Salesforce (optional) |
| **2024-01** | 5000 | January 2024 usage |
| **2024-02** | 5500 | February 2024 usage |
| **2024-03** | 6000 | March 2024 usage |
| **...** | ... | Add as many months as you have |

**Important:** Monthly columns should be in `YYYY-MM` format (e.g., 2024-01, 2024-11, 2025-01)

### Step 2: Import Your Data

1. Click **"📁 Import CSV/Excel"** button
2. Select your file (CSV or Excel)
3. Done! Your dashboard populates instantly

**OR use the template:**
1. Click **"📥 Download Template"** button
2. Fill in your data
3. Import it back

## ✏️ Updating Data

### Adding Monthly Usage (Super Easy!)

1. **Click on any month value** in a customer card
2. Enter the new amount
3. Click Save
4. The dashboard automatically recalculates everything!

### Adding a New Month

1. Click the **"+ Add Month"** button on any customer card
2. Enter the month (format: 2024-11)
3. Enter the usage amount
4. Done!

### Editing Total Credits or ARR

Just **click on the value** and edit it. The dashboard will automatically recalculate all projections.

## 📊 What the Dashboard Shows

Each customer card displays:

- ✅ **Status Badge**: Green (Healthy), Yellow (Warning), Red (Critical)
- 💰 **ARR**: Annual Recurring Revenue
- 🎫 **Total Credits**: Total prepaid amount
- 📉 **Credits Used**: Sum of all monthly usage
- 💵 **Remaining Credits**: What's left
- 📈 **MoM Growth Rate**: Average month-over-month growth
- ⏰ **Months Until Empty**: Based on current growth trends
- 📅 **Projected Empty Date**: When credits will run out
- 📊 **Recent Monthly Usage**: Last 6 months (editable!)
- 📊 **Progress Bar**: Visual representation of usage

## 🎯 How Projections Work

The dashboard calculates **month-over-month (MoM) growth rate** by:

1. Looking at your historical monthly usage
2. Calculating the average growth between months
3. Projecting forward assuming that growth continues
4. Telling you when credits will run out

**Example:**
- Jan: $5,000
- Feb: $5,500 (10% growth)
- Mar: $6,000 (9% growth)
- Average MoM growth: 9.5%

The dashboard will project that each future month will grow by 9.5% and calculate when you'll hit zero.

## 🎨 Color Coding

- 🟢 **Green (Healthy)**: More than 6 months of credits remaining
- 🟡 **Yellow (Warning)**: 3-6 months of credits remaining
- 🔴 **Red (Critical)**: Less than 3 months of credits remaining

## 💾 Data Management

### Export Your Data
Click **"💾 Export Data"** to download your current data as an Excel file. Great for:
- Backing up your data
- Sharing with team members
- Importing into other systems

### Clear All Data
Click **"🗑️ Clear All Data"** to start fresh. **Warning:** This cannot be undone!

## 🔒 Data Storage

All your data is stored **locally in your browser**. This means:
- ✅ Private and secure (never leaves your computer)
- ✅ No internet required (after loading the page)
- ✅ Persists between sessions
- ⚠️ Clearing browser data will delete it (export regularly!)

## 💡 Tips & Best Practices

1. **Export regularly**: Click "Export Data" monthly to keep backups
2. **Update monthly**: Add new usage data at the start of each month
3. **Check projections**: Review customers in "Warning" or "Critical" status
4. **Use SFDC links**: Add Salesforce links for quick access to customer records
5. **Monitor growth**: Watch MoM growth rates to spot usage spikes early

## 🆚 Spreadsheet vs API Version

| Feature | Spreadsheet Version | API Version |
|---------|-------------------|-------------|
| Setup | Import CSV once | Configure API keys |
| Updates | Manual entry | Automatic from API |
| Internet | Not needed* | Required |
| Control | Full manual control | Automatic |
| Best For | Sales/CS teams | Technical teams |

*Only needed for initial page load

## 📝 Sample Workflow

**Monthly Routine (5 minutes):**

1. Open dashboard: `start-dashboard-spreadsheet.command`
2. For each customer, click "+ Add Month"
3. Enter the new month (e.g., 2024-11) and usage
4. Review customers in Warning/Critical status
5. Click "Export Data" to save a backup
6. Done!

## ❓ Troubleshooting

### Data disappeared
- Check if you cleared browser data
- Import your last exported backup

### Wrong projections
- Make sure monthly columns are in YYYY-MM format
- Ensure you have at least 2 months of data for growth calculations

### Can't import file
- Make sure it's CSV or Excel format (.csv, .xlsx, .xls)
- Check that required columns exist: Project ID, Company Name, Total Credits
- Download the template to see the correct format

### "Permission denied" when starting
- Right-click `start-dashboard-spreadsheet.command`
- Select "Open" and confirm

## 🎓 Example Use Case

**Scenario:** You manage 20 customers with prepaid credits.

**Monthly Process:**
1. Export usage data from your internal systems
2. Add a new column for the current month to your tracking spreadsheet
3. Import the updated spreadsheet into the dashboard
4. Instantly see which customers need attention
5. Reach out to customers in "Warning" status about renewals
6. Send alerts to customers in "Critical" status

**Result:** Never caught off-guard by depleted credits!

---

## 🚀 Ready to Start?

1. Double-click `start-dashboard-spreadsheet.command`
2. Click "Download Template"
3. Fill in your customer data
4. Import it
5. Start tracking!

Enjoy your new dashboard! 🎉

