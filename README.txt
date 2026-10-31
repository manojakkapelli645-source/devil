CivicMap Mumbai - My Complaints + Image Upload Update

Changes:
- Removed the Image Path field.
- Added real image selection from the computer.
- Added image preview.
- Dashboard-added complaint images are stored in browser localStorage as Data URLs.
- My Complaints now displays image, heading, description, location, Report ID and status.
- Remove Complaint exists only in My Complaints.
- Removing a complaint from My Complaints does NOT remove it from Civic Complaints and Progress.
- Existing streetlight, water, pothole and drain demo images continue to display.
- FastAPI/SQLite backend is preserved.

Run:
    cd D:\CEP_Project
    py -m uvicorn backend.main:app --host 127.0.0.1 --port 8000 --reload

Open:
    http://127.0.0.1:8000/dashboard.html

Uploaded dashboard images: JPG/JPEG/PNG/WEBP, maximum 5 MB.


=====================================================================
LOGIN PAGE + ADMIN PAGE UPDATE
=====================================================================

New files
  login.html      Log in / Create account page
  admin.html      Admin panel (only admins can open it)
  auth.js         Shared login helper (adds Log in / Log out to every page header)
  auth.css        Styles for the login and admin pages
  backend/auth_core.py   Login, password and admin logic (no extra packages)
  .vscode/        F5 / Run Task setup for VS Code
  run.bat         Double-click start for Windows

Changed files
  backend/main.py  New /api/auth/* and /api/admin/* routes, blocks download of backend files
  app.js           Sends the login token with new complaints; admin status changes show on the citizen's dashboard
  index/about/map-report/dashboard/community .html   Only the auth.css + auth.js lines were added

ADMIN LOGIN (created automatically the first time the server starts)
  Username : admin
  Password : Admin@123
  To use another admin password, set it BEFORE the very first start (Windows cmd):
     set CIVICMAP_ADMIN_PASSWORD=MyNewPassword
  The admin account is only created once. To reset it later, stop the server and
  delete backend\civicmap.db's "users" data by replacing the file with your original
  civicmap.db, then start again.

Citizens
  Anyone can click "Create account" on login.html. Logging in is optional for
  reporting; if a citizen is logged in, the complaint is linked to their name.

What the admin can do (admin.html)
  - See all complaints from the database with reporter, date and photos
  - Search and filter by status / category
  - Change status: Complaint Submitted, Verified, Work In Progress, Work Completed, Failed
    (for Failed, a reason is asked and shown to the citizen)
  - Delete a complaint (also deletes its photos)
  - See the list of registered citizens

HOW TO RUN IN VS CODE
  1. File > Open Folder... and choose this project folder (the one that has index.html).
  2. First time only: Terminal > New Terminal, then run
        py -m pip install -r backend/requirements.txt
  3. Press F5 (Run > Start Debugging). Pick "CivicMap: run server" if asked.
     OR in the terminal run:
        py -m uvicorn backend.main:app --host 127.0.0.1 --port 8000 --reload
  4. Open  http://127.0.0.1:8000/login.html
        Admin panel: http://127.0.0.1:8000/admin.html
  Important: open the website through http://127.0.0.1:8000 (not by double-clicking
  the .html files) so the login works.
  VS Code Live Server (port 5500) also works as long as the backend above is running.
