# Enable cloud sync (one-time owner setup)

This project is prepared for Supabase cloud persistence, but it cannot be connected until the business owner creates or authorizes a Supabase project. No account credentials were supplied, and this package does not create an account or deploy to a public URL.

1. Create a project at https://supabase.com/ and keep its database region suitable for the business.
2. In Supabase Dashboard → SQL Editor, run all statements in `supabase-schema.sql`.
3. In Project Settings → API, copy the Project URL and the public anon/publishable key. **Never use or share the service_role key.**
4. Open the app, go to Data & Settings → Cloud database connection, paste the Project URL and public key, then choose Connect / Sign in.
5. Create the owner account with the business owner's email and a strong password. Confirm the email if Supabase asks.
6. On the other device, open the same deployed app, enter the same Project URL and public key, and sign in with the same owner account.
7. Test with a dummy product and purchase on one device; verify it appears on the other. Then delete the dummy records.

## Deployment
Deploy the extracted folder to a static HTTPS host (for example Vercel or Netlify). Set the project root to this folder. The `index.html`, `manifest.webmanifest`, and `sw.js` must remain together. The app uses the Supabase JS CDN, so the browser needs internet access for authentication and cloud sync.

## Important
- Existing records on the first device are not automatically merged with records already in the cloud. The initial cloud account creates a new cloud state from the current local data only if no cloud row exists. If you have important existing data on multiple devices, export and reconcile backups before connecting.
- The current implementation stores the business data as a JSON payload in one row. This is a small-shop starter, not a full accounting-grade multi-table ledger.
- Keep daily JSON backups. Test restore before entering live records.
- Configure Supabase Auth email confirmation and password recovery for the owner.
- GST rates, tax treatment, invoice fields and statutory compliance must be confirmed with the company's accountant.

## Customer bill sharing (v2.1)
During each sale, enter the customer's mobile number including country code if applicable. The bill preview offers SMS, WhatsApp and PDF sharing. SMS opens a pre-filled message for the owner to send; WhatsApp opens the customer's chat; PDF sharing uses the device's share sheet or downloads the file. A website cannot silently send SMS or attach a PDF directly to an SMS. Automated SMS delivery requires an SMS gateway provider and server-side setup.
