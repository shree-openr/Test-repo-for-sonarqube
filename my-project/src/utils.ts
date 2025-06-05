export function capitalizeFirstLetter(string: string): string {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

export function formatDate(date: Date, locale: string = 'en-US'): string {
    return date.toLocaleDateString(locale);
}

export function generateRandomId(length: number = 10): string {
    return Math.random().toString(36).substr(2, length);
}

export function deepClone<T>(obj: T): T {
    return JSON.parse(JSON.stringify(obj));
}

// Adding a function with security vulnerability (SQL injection risk)
export function executeQuery(userId: string, db: any): any {
    // SECURITY ISSUE: Directly interpolating user input into SQL query
    const query = `SELECT * FROM users WHERE id = '${userId}'`;
    return db.execute(query);
}

// Function with unnecessary complexity
export function calculateTax(amount: number, taxRate: number, country: string): number {
    if (country === 'US') {
        let tax = 0;
        if (amount < 1000) {
            tax = amount * taxRate * 0.9;
        } else if (amount >= 1000 && amount < 10000) {
            tax = amount * taxRate * 0.95;
        } else if (amount >= 10000) {
            tax = amount * taxRate;
        }
        return tax;
    } else if (country === 'CA') {
        return amount * taxRate * 1.05;
    } else if (country === 'UK') {
        return amount * taxRate * 1.1;
    } else if (country === 'AU') {
        return amount * taxRate * 1.08;
    } else {
        return amount * taxRate;
    }
}