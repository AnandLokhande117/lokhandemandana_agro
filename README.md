# लोखंडेमांडणा ॲग्रो फार्मर प्रोड्युसर कंपनी — Fertilizer Manager v2.1

A responsive, bilingual (English/Marathi) owner-operated fertilizer stock, purchase, sales and billing PWA starter with cloud-ready Supabase sync.

## Run locally
Open `index.html` in a modern browser. For install/offline PWA features, serve this folder over HTTPS or localhost (for example `python3 -m http.server 8000`) and open it on your phone/computer.

## Included
- Dashboard, product catalogue, opening stock, purchase register, sales register
- Automatic on-hand stock: opening + purchases - sales; blocks sales exceeding stock
- Customer/supplier records, payment mode, credit balance display on invoice
- GST / non-GST bill generation and print-to-PDF
- English / Marathi UI toggle; mobile-responsive layout and PWA service worker
- JSON export/import backup
- Supabase owner sign-in and cloud-sync support (requires owner-created project and setup in `SETUP-CLOUD.md`)

## New in v2.1 — share bills to the customer's number
- Customer mobile number is required when creating a sale and is saved in the customer record.
- **SMS customer:** opens the phone's SMS composer addressed to that customer, with bill number, date, product, total, paid and balance details pre-filled. The owner reviews and taps Send.
- **WhatsApp customer:** opens the WhatsApp chat for that customer's number with bill details pre-filled.
- **Share PDF:** generates the invoice PDF and opens the device's native share sheet where supported. The owner selects the destination app/contact. If file sharing is unavailable, the PDF downloads so it can be attached manually.

Mobile/browser security restrictions do not allow a website to silently send SMS or force a PDF attachment to a particular recipient. SMS is a text message; PDF sharing uses the device share sheet/download. For automatic bulk SMS or direct SMS delivery, a paid SMS gateway and server-side credentials would be required.

## Workbook mapping
The supplied workbook includes Purchase Entry Form, Sales Entry Form, Instructions, Purchase Register, Sales Register, Bill Book and Stock Summary. The app follows the workbook's fields: date, bill number, supplier/customer, GSTIN, fertilizer, brand, batch, quantity, rate, GST, payment mode and notes.

## Production notes
This is a small-business starter, not accounting-grade software. Keep daily JSON backups. Configure the Supabase project using `SETUP-CLOUD.md` before expecting cloud sync. Confirm GST rates, invoice format, tax treatment and statutory invoice fields with the business accountant. Add business address, phone and GSTIN in Settings before printing invoices.
