/**
 * 
 */
// !달력날짜선택
//Get today's date
const today = new Date();

// Calculate the date for tomorrow
const tomorrow = new Date(today);
tomorrow.setDate(today.getDate() + 1);

// Calculate the date 28 days from today
const maxDate = new Date(today);
maxDate.setDate(today.getDate() + 28);

// Format the dates in 'YYYY-MM-DD' format
const formattedTomorrow = tomorrow.toISOString().split('T')[0];
const formattedMaxDate = maxDate.toISOString().split('T')[0];

// Set the minimum and maximum values for the input
const datePicker = document.getElementById('datePicker');
datePicker.min = formattedTomorrow;
datePicker.max = formattedMaxDate;