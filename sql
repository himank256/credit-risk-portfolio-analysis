/*
Purpose: Portfolio Health Overview
*/

SELECT 
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received,

    -- Net Return
    SUM(total_payment) - SUM(loan_amount) AS net_return,
    100.0 * (SUM(total_payment) - SUM(loan_amount)) 
        / SUM(loan_amount) AS net_return_pct,

    -- Bad Loan Rate
    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) 
        / COUNT(*) AS bad_loan_rate,

    -- Recovery Rate
    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN total_payment ELSE 0 END)
        / SUM(CASE WHEN loan_status = 'Charged Off' THEN loan_amount ELSE 0 END) 
        AS recovery_rate

FROM dbo.Bank_Loan_DATA;

/*
Purpose: Risk vs Pricing by Grade
*/

SELECT 
    grade,
    COUNT(*) AS total_loans,
    
    AVG(int_rate) AS avg_interest_rate,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate,

    SUM(total_payment - loan_amount) AS net_return

FROM dbo.Bank_Loan_DATA
GROUP BY grade
ORDER BY grade;

/*
Purpose: Default Risk vs DTI
*/

SELECT 
    CASE 
        WHEN dti < 15 THEN 'Low DTI'
        WHEN dti BETWEEN 15 AND 30 THEN 'Medium DTI'
        ELSE 'High DTI'
    END AS dti_band,

    COUNT(*) AS total_loans,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate

FROM dbo.Bank_Loan_DATA
GROUP BY 
    CASE 
        WHEN dti < 15 THEN 'Low DTI'
        WHEN dti BETWEEN 15 AND 30 THEN 'Medium DTI'
        ELSE 'High DTI'
    END;

/*
Purpose: Does verification reduce risk?
*/

SELECT 
    verification_status,

    COUNT(*) AS total_loans,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate,

    SUM(total_payment - loan_amount) AS net_return

FROM dbo.Bank_Loan_DATA
GROUP BY verification_status;

/*
Purpose: Profitability of small business loans
*/

SELECT 
    purpose,

    COUNT(*) AS total_loans,

    SUM(loan_amount) AS total_funded,

    SUM(total_payment) AS total_received,

    SUM(total_payment - loan_amount) AS net_return,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate

FROM dbo.Bank_Loan_DATA
WHERE purpose = 'small_business'
GROUP BY purpose;

/*
Purpose: Purpose vs Term risk & return
*/

SELECT 
    purpose,
    term,

    COUNT(*) AS total_loans,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate,

    SUM(total_payment - loan_amount) AS net_return

FROM dbo.Bank_Loan_DATA
GROUP BY purpose, term
ORDER BY purpose, term;

/*
Purpose: Impact of employment length
*/

SELECT 
    emp_length,

    COUNT(*) AS total_loans,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate

FROM dbo.Bank_Loan_DATA
GROUP BY emp_length
ORDER BY emp_length;

/*
Purpose: Loan-to-Income (LTI) Risk Bands
*/

SELECT 
    CASE 
        WHEN loan_amount / annual_income < 0.2 THEN 'Low LTI'
        WHEN loan_amount / annual_income BETWEEN 0.2 AND 0.4 THEN 'Medium LTI'
        ELSE 'High LTI'
    END AS lti_band,

    COUNT(*) AS total_loans,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate,

    SUM(total_payment - loan_amount) AS net_return

FROM dbo.Bank_Loan_DATA
WHERE annual_income > 0

GROUP BY 
    CASE 
        WHEN loan_amount / annual_income < 0.2 THEN 'Low LTI'
        WHEN loan_amount / annual_income BETWEEN 0.2 AND 0.4 THEN 'Medium LTI'
        ELSE 'High LTI'
    END;

/*
Purpose: State-level default exposure
*/

SELECT 
    address_state,

    COUNT(*) AS total_loans,

    SUM(CASE WHEN loan_status = 'Charged Off' THEN loan_amount ELSE 0 END) 
        AS total_default_amount,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate

FROM dbo.Bank_Loan_DATA
GROUP BY address_state
ORDER BY total_default_amount DESC;

/*
Purpose: State-level default exposure
*/

SELECT 
    address_state,

    COUNT(*) AS total_loans,

    SUM(CASE WHEN loan_status = 'Charged Off' THEN loan_amount ELSE 0 END) 
        AS total_default_amount,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate

FROM dbo.Bank_Loan_DATA
GROUP BY address_state
ORDER BY total_default_amount DESC;

/*
Purpose: Heatmap dataset for Power BI
*/

SELECT 
    grade,
    purpose,

    COUNT(*) AS total_loans,

    SUM(total_payment - loan_amount) AS net_return,

    100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        / COUNT(*) AS default_rate

FROM dbo.Bank_Loan_DATA
GROUP BY grade, purpose;
