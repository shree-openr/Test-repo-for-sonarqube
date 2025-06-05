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