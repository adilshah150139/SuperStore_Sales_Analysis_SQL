# 🛒 Superstore Sales Analysis

> An end-to-end data analysis project exploring retail sales data 
> using SQL and Python to uncover profit leaks, top customers, 
> regional performance, and growth opportunities.

---

## 📖 Summary

This project analyzes the Superstore sales dataset to answer key 
business questions about profitability, customer value, regional 
performance, and sales trends.

The workflow follows a complete analytics pipeline:

**Raw CSV → Database Setup → Data Profiling → Business Analysis → 
Python Visualization → Insights**

**Key Finding:** A small number of sub-categories and products drive 
the majority of losses, while a handful of customers and regions 
generate most of the profit.

---
## 📂 Dataset
- **Kaggle:** [Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

## 📊 Visualizations & Insights

### 🏆 Top 10 Sub-Categories by Revenue
- Chairs ($3.33M) and Phones ($3.26M) lead the pack — combined $6.58M.
- All top 10 sub-categories exceed $1M in revenue.
- Revenue is concentrated in the top 5, which contribute over $13M.

### 💰 Sub-Category Profit & Loss — Focus on Loss-Making Products**
![Category Profitability](OUTPUT/Charts/subcategory_loss_highlighted.png)
Out of 17 sub-categories, only **three are loss-making**, but their combined impact is significant:

| Sub-Category | Total Profit | Share of Total Losses |
|--------------|--------------|-----------------------|
| **Tables** | **-$35,500** | **79%** |
| **Bookcases** | **-$6,900** | 15% |
| **Supplies** | **-$2,400** | 6% |
| **Total Loss** | **-$44,800** | **100%** |

**Key Findings:**

- **Tables is the single biggest loss-maker**, accounting for **79% of all losses** — a $35.5K deficit that wipes out the profit of several other sub-categories combined.
- **Bookcases and Supplies** add another **$9.3K in losses**, bringing the total damage to **$44.8K**.
- The three loss-making sub-categories span **two different categories** (Furniture and Office Supplies), suggesting the problem is not isolated to one product line.

**The Contrast — Top Profit Drivers:**

| Sub-Category | Total Profit |
|--------------|--------------|
| **Copiers** | **+$111.2K** |
| **Phones** | **+$89.0K** |
| **Accessories** | **+$83.9K** |
| **Paper** | **+$68.1K** |
| **Binders** | **+$60.4K** |

- **Copiers alone ($111.2K) generate 2.5x more profit** than the total losses of Tables, Bookcases, and Supplies combined.
- The **top 5 profitable sub-categories contribute $412.6K** — the business stays profitable only because a few strong performers offset the losses.

### 👤 Top 5 Customers by Spending
![Top Customer](OUTPUT/Charts/top_5_customers_total_spending.png)
- **Top Spender:** **Sean Miller** leads all customers with **~$50,000** in total spending across **5 orders** (~$10k average order value).
- **High-Value vs. High-Frequency:** **Adrian Barton** placed the most orders (**10 orders**), but generated less revenue (~$29k) than buyers with fewer, larger transactions.
- **Key Takeaway:** Top spending is driven primarily by **high average order value** rather than transaction volume.

### 🌍 Regional Sales Analysis

#### Top Performing Sub-Categories

| Region | Sub-Category | Total Sales ($) |
| :--- | :--- | :--- |
| **West** | Chairs | 203,562.72 |
| **East** | Phones | 201,230.04 |
| **Central** | Chairs | 170,461.36 |
| **South** | Phones | 116,608.86 |

#### Key Insights

- **Category Dominance:** Regional sales are strictly driven by two core categories—**Chairs** in the West and Central regions, and **Phones** in the East and South regions.
- **Top Region:** **West** leads overall top sales at **$203,562.72**, closely followed by **East** at **$201,230.04**.
- **Lowest Region:** **South** generated the lowest top-performing revenue at **$116,608.86**.

![Regional Revenue](OUTPUT/Charts/top_subcategories_by_region.png)

### 📈 Revenue Growth & Seasonality (2014–2017)

- **60% Overall Growth:** Revenue expanded steadily from 2014 to 2017, with baseline monthly sales increasing over time.
- **Strong Q4 Seasonality:** Demand consistently spikes in Q4 (October–December) each year, reaching a record peak of ~$235,000 in late 2017.
- **Post-Holiday Q1 Slump:** Revenue sharply contracts in Q1 (January–February) immediately following the holiday season.
- **Rising Revenue Floor:** Despite seasonal dips, the lowest sales points grew from ~$10,000 in early 2014 to ~$40,000 in early 2017.
![Revenue Growth Tracking](OUTPUT/Charts/revenue_growth_tracking.png)

## 🚚 Shipping Mode Analysis

### Overview Table

| Ship Mode | Avg Shipping Days | Avg Profit ($) | Total Sales ($) |
| :--- | :--- | :--- | :--- |
| **Standard Class** | 5.01 | 27.49 | 2,716,432.16 |
| **Second Class** | 3.24 | 29.54 | 918,386.88 |
| **First Class** | 2.18 | 31.84 | 702,856.86 |
| **Same Day** | 0.04 | 29.27 | 256,726.24 |

#### Key Insights

- **Volume Driver:** **Standard Class** generates the vast majority of revenue ($2.72M) despite having the longest average shipping time (~5 days).
- **Highest Profitability:** **First Class** yields the highest average profit per order ($31.84) and delivers in roughly 2.2 days.
- **Fastest Delivery:** **Same Day** shipping boasts an impressive average delivery time under 1 day (~0.04 days), but accounts for the lowest sales volume ($256.7k).












## 📂 Database Schema 

| Table | Key Columns |
|-------|-------------|
| `superstore` | Order ID, Order Date, Ship Date, Ship Mode, Customer ID, Product ID, Sales, Profit, Quantity, Discount, Region, Category, Sub-Category |

### Performance Optimization
```sql
CREATE INDEX idx_customer_id ON superstore(customer_id);
CREATE INDEX idx_product_id ON superstore(product_id);
CREATE INDEX idx_order_date ON superstore(order_date);
```

---

## 📊 SQL Queries

| # | Query File | Description |
|---|------------|-------------|
| 1 | [01_data_overview.sql](/SQL_FILES/01_data_overview.sql) | Check for NULL values |
| 2 | [02_category_profitability.sql](/SQL_FILES/02_category_profitability.sql) | Product profitability analysis |
| 3 | [03_top_customers.sql](/SQL_FILES/03_top_customers.sql) | Top customers analysis |
| 4 | [04_regional_sales.sql](/SQL_FILES/04_regional_sales.sql) | Regional performance |
| 5 | [05_monthly_sales_trends.sql](/SQL_FILES/05_monthly_sales_trends.sql) | Monthly sales & profit |
| 6 | [06_shipping_efficiency.sql](/SQL_FILES/06_shipping_efficiency.sql) | Logistics analysis |
## 📊 Analysis Queries & Results

### Query 1: Data Quality Check

**Purpose:** Verify total rows and check for NULL values.
```sql
SELECT 
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(order_id) AS null_order_id,
    COUNT(*) - COUNT(customer_id) AS null_customer_id,
    COUNT(*) - COUNT(product_id) AS null_product_id,
    COUNT(*) - COUNT(sales) AS null_sales,
    COUNT(*) - COUNT(profit) AS null_profit
FROM superstore;
```

**Results:**
| total_rows | null_order_id | null_customer_id | null_product_id | null_sales | null_profit |
|------------|---------------|------------------|-----------------|------------|-------------|
| 9,994 | 0 | 0 | 0 | 0 | 0 |

**Insight:** ✅ No NULL values found. Dataset is clean and ready for analysis.

---

### Query 2: Category & Sub-Category Profitability

**Purpose:** Identify most and least profitable products.

```sql
SELECT 
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit
FROM superstore
GROUP BY category, sub_category
ORDER BY total_profit DESC;
```

| Category | Sub-Category | Total Sales | Total Profit | Avg Profit Per Order | Status |
|----------|--------------|-------------|--------------|---------------------|--------|
| Technology | Copiers | $149,528.01 | **$55,617.90** | $817.91 | ✅ Highly Profitable |
| Technology | Phones | $330,007.10 | **$44,516.25** | $50.07 | ✅ Profitable |
| Technology | Accessories | $167,380.31 | **$41,936.78** | $54.11 | ✅ Profitable |
| ... | ... | ... | ... | ... | ... |
| Office Supplies | Supplies | $46,673.52 | **-$1,188.99** | -$6.26 | ❌ Loss |
| Furniture | Bookcases | $114,880.05 | **-$3,472.56** | -$15.23 | ❌ Loss |
| Furniture | Tables | $206,965.68 | **-$17,725.59** | -$55.57 | ❌ Loss |

---

### 📊 Summary by Category

| Category | Total Sales | Total Profit | Status |
|----------|-------------|--------------|--------|
| Technology | $836,154.10 | **$145,455.66** | 🏆 Best |
| Office Supplies | $719,098.75 | **$123,269.88** | ✅ Good |
| Furniture | $742,000.00 | **$18,451.25** | ⚠️ Needs Improvement |
---

**Insights:**
- ✅ **Top Performers:** Copiers, Phones, Accessories
- ❌ **Loss Makers:** Tables, Bookcases (negative profit!)
- 💡 **Action:** Investigate pricing/costs for Tables and Bookcases

---

### Query 3: Customer Lifetime Value

**Purpose:** Identify top 5 customers by total spending.

```sql
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_spent,
    AVG(sales) AS avg_order_value
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 5;
```

| Rank | Customer ID | Customer Name | Total Orders | Total Spent |
|------|-------------|---------------|--------------|-------------|
| 1 | SM-20320 | Sean Miller | 5 | **$25,043.07** |
| 2 | TC-20980 | Tamara Chand | 5 | **$19,052.22** |
| 3 | RB-19360 | Raymond Buch | 6 | **$15,117.35** |
| 4 | TA-21385 | Tom Ashbrook | 4 | **$14,595.62** |
| 5 | AB-10105 | Adrian Barton | 10 | **$14,473.57** |

---

### 💡 Observations

- 🏆 **Sean Miller** = Highest spender + Highest avg order value → VIP customer
- 📦 **Adrian Barton** = Most loyal (10 orders) but spends less per order → Cross-sell opportunities
- 📈 **Tom Ashbrook** = Fewest orders (4) but high avg order ($3,648) → Encourage more purchases
- 💰 **Top 5 customers** contribute $88K+ in revenue → Need a loyalty program

---

### Query 4: Regional Top-Selling Products

**Purpose:** Identify top-performing product in each region.

```sql
WITH regional_sales AS (
    SELECT 
        region,
        sub_category,
        SUM(sales) AS total_sales,
        DENSE_RANK() OVER (PARTITION BY region ORDER BY SUM(sales) DESC) AS sales_rank
    FROM superstore
    GROUP BY region, sub_category
)
SELECT region, sub_category, total_sales
FROM regional_sales
WHERE sales_rank = 1;
```

**Results:**
| Region | Top Sub-Category | Total Sales |
|--------|------------------|-------------|
| West | Chairs | $101,781.36 |
| East | Phones | $100,615.02 |
| Central | Chairs | $85,230.68 |
| South | Phones | $58,304.43 |

### 📊 Key Insights

| Insight | Finding |
|---------|---------|
| **Top Performing Region** | West ($101,781.36) |
| **Underperforming Region** | South ($58,304.43) |
| **Most Popular Product** | Chairs (Top in West & Central) |
| **Second Most Popular** | Phones (Top in East & South) |

---

### 💡 Observations

- 🥇 **West** leads Chair sales ($101,781) - strong furniture market
- 📱 **East** follows closely with Phones ($100,615) - strong tech market
- 🪑 **Chairs** dominate 2 regions (West, Central)
- 📱 **Phones** dominate 2 regions (East, South)
- ⚠️ **South** underperforms - needs marketing investment

---


### Query 5: Monthly Sales & Profit Trends

**Purpose:** Identify seasonal patterns and growth trends.

```sql
SELECT 
    DATE_TRUNC('month', order_date) AS order_month,
    SUM(sales) AS monthly_sales,
    SUM(profit) AS monthly_profit
FROM superstore
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY order_month DESC;
```

**Results (Sample):**
### Monthly Performance (First & Last Months)


| order_month | monthly_sales | monthly_profit |
|-------------|---------------|----------------|
| 2017-12-01 | $83,829.31 | $8,483.40 |
| 2017-11-01 | $118,447.81 | $9,690.10 |
| ... | ... | ... |
| 2015-01-01 | $18,174.08 | **-$3,280.97** |
| ... | ... | ... |
| 2014-02-01 | $4,519.92 | $862.30 |
| 2014-01-01 | $14,236.90 | $2,450.18 |

---

### 📊 Key Metrics

| Metric | Value |
|--------|-------|
| **Highest Sales** | $118,447.81 (Nov 2017) |
| **Lowest Sales** | $4,519.92 (Feb 2014) |
| **Highest Profit** | $17,885.28 (Dec 2016) |
| **Lowest Profit (Loss)** | **-$3,280.97** (Jan 2015) |
| **Loss Months** | Jan 2015 (-$3,280.97), Jul 2014 (-$841.46) |

---

### 💡 Key Insights

- 📈 **Strong growth** from 2014 to 2017
- 🎄 **November-December** are peak sales months
- 📉 **January-February** are slowest months
- ⚠️ **Loss months**: January 2015 (-$3,280.97), July 2014 (-$841.46)
- 🏆 **Most profitable month**: December 2016 ($17,885.28)

---


### Query 6: Shipping Efficiency Analysis

**Purpose:** Compare shipping speed vs profitability.

```sql
SELECT 
    ship_mode,
    AVG(EXTRACT(DAY FROM (ship_date - order_date))) AS avg_shipping_days,
    AVG(profit) AS avg_profit,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY
    ship_mode
ORDER BY 
    avg_profit DESC;

```

**Results:**
## 📦 Logistics & Shipping Efficiency

| Ship Mode | Avg Shipping Days | Avg Profit Per Order | Total Sales |
|-----------|-------------------|---------------------|-------------|
| First Class | 2.18 days | **$31.84** | $351,428.43 |
| Second Class | 3.24 days | $29.54 | $459,193.44 |
| Same Day | 0.04 days | $29.27 | $128,363.12 |
| Standard Class | 5.01 days | $27.49 | $1,358,216.08 |

---

### 📊 Key Insights

| Metric | Best | Worst |
|--------|------|-------|
| **Fastest Shipping** | Same Day (0.04 days) | Standard Class (5.01 days) |
| **Highest Profit Per Order** | First Class ($31.84) | Standard Class ($27.49) |
| **Highest Sales Volume** | Standard Class ($1.36M) | Same Day ($128K) |
| **Best Balance** | Second Class | - |

---

### 💡 Key Takeaways

- 🚀 **Same Day** = Fastest shipping (0.04 days)
- 💰 **First Class** = Highest profit per order ($31.84)
- 📦 **Standard Class** = 58% of total sales but lowest profit
- ⚖️ **Second Class** = Best balance of speed, profit, and volume
- 💡 Faster shipping = **higher profit per order**

---

---

## 🎉 Final Conclusion

And that's a wrap! 🎬 This SQL analysis of the Superstore dataset uncovered some **pretty cool insights** that can actually help a business grow. Let's break down what we found and what we can do about it! 👇

---

### 📊 Key Findings at a Glance

| Area | What We Found | 💡 Why It Matters |
|------|---------------|-------------------|
| **Product Profitability** | Technology rules! Copiers, Phones & Accessories are money-makers. Tables & Bookcases? Not so much... | Time to rethink pricing or say goodbye to loss-makers! |
| **Customer Value** | Top 5 customers spent **$88K+** combined! Sean Miller is our VIP with $25K spent | Let's treat these rockstars like royalty! |
| **Regional Performance** | West = ($101K). South = ($58K). Big gap! | Time to show the South some love with more marketing |
| **Shipping Efficiency** | Faster shipping = higher profit! First Class = $31.84 per order vs Standard = $27.49 | Let's get customers to choose faster shipping! |
| **Seasonal Trends** | November-December =  CRAZY busy! January-February = snooze fest | Plan promotions for the slow months! |

---

### 💡 Top 5 Things We Should Do Right Now

| Priority | Action | Why? |
|----------|--------|------|
| 🔴 **Do It NOW!** | Fix pricing on **Tables & Bookcases** | They're losing money! Let's turn that around |
| 🔴 **Do It NOW!** | Go ALL IN on **Copiers, Phones & Accessories** | These are our cash cows! |
| 🟡 **Let's Plan It** | Promote **First Class** shipping more | Higher profit per order = happy finance team!  |
| 🟡 **Let's Plan It** | Start a **loyalty program** for top customers | Keep our VIPs coming back for more! |
| 🟢 **Nice to Have** | Run **January-February promotions** | Let's beat the post-holiday blues! |

---

### 🛠️ SQL Superpowers I Used

Here's the cool SQL stuff I practiced in this project:

| Skill | What I Did | 
|-------|------------|
| **Data Cleaning** | Found zero NULL values! Dataset was squeaky clean  |
| **Window Functions** | Used `DENSE_RANK()` to find top products per region | 
| **CTEs** | Made complex queries look clean & readable | 
| **Date Functions** | `DATE_TRUNC()` to see monthly trends | 
| **Aggregations** | `SUM()`, `AVG()`, `COUNT()` to crunch numbers |

---

### 🚀 What I Learned

> **Data is just numbers until you ask the right questions!** 

This project taught me how to:
- ✅ Think like a business analyst 
- ✅ Turn raw data into actionable insights 
- ✅ Write clean, professional SQL queries 
- ✅ Present findings in a way that actually makes sense 

---

### 🔮 What's Next?

| Step | What I Want to Do |  Goal |
|------|-------------------|---------|
| **Visualization** | Build dashboards in Power BI or Tableau | Make insights even more visual! |
| **Predictive Analysis** | Forecast future sales with Python | Predict the future! |
| **Automation** | Set up monthly automated reports | Save time & be efficient!  |
| **More Data** | Analyze other cool datasets | Keep learning & growing! |

---

### 🙏 A Big Thank You!

If you made it this far... **THANK YOU!** 

This project was a fun deep dive into the world of SQL and business analytics. I hope you found it as interesting as I did!

---

## 👨‍💻 Let's Connect!

Hey there! 👋 I'm **Adil Shah**

- 🐙 **GitHub:** [github.com/adilshah150139](https://github.com/adilshah150139)
- 💼 **LinkedIn:** [linkedin.com/in/adilshah150139](https://linkedin.com/in/adilshah150139)
- 📧 **Email:** adil.shah150139@gmail.com

I'm always open to:
- 🤝 Collaborations
- 💬 Feedback on this project
- 🚀 Exciting opportunities
- ☕ A virtual coffee chat!

---

### ⭐ One Last Thing...

If you found this project helpful or interesting, **please give it a star**       on GitHub! It really motivates me to keep learning and sharing! 🚀

---

**Happy Analyzing!** 📊✨

---
