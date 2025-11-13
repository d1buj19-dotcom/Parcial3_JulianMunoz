// ========== POST: new student ==========
router.post("/insert-student", async (req, res) => {
  const db = new SqlService();
  const { studentCode, name, state, city, phone } = req.body;

  if (!studentCode || !name || !state || !city || !phone) {
    return res.status(400).send("Missing fields.");
  }

  try {
    await db.connectToDb();
    const query = `
      INSERT INTO student (studentCode, name, state, city, phone)
      VALUES (?, ?, ?, ?, ?)
    `;
    await db.query(query, [studentCode, name, state, city, phone]);
    res.status(201).json({ message: "student insertado correctamente" });
  } catch (error) {
    console.error("Error al insertar student:", error);
    res.status(500).json({
      error: "Error al insertar student",
      details: error.message,
    });
  } finally {
    await db.closeConnection();
  }
});


// ========== GET: all student ==========
router.get("/get-all-student", async (req, res) => {
  const db = new SqlService();

  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 5;
    const offset = (page - 1) * limit;

    await db.connectToDb();

    const student = await db.query(
      `SELECT * FROM student LIMIT ? OFFSET ?`,
      [limit, offset]
    );

    const countResult = await db.query(`SELECT COUNT(*) AS total FROM student`);
    const total = countResult[0].total || 0;

    res.status(200).json({
      current_page: page,
      page_size: limit,
      total: total,
      data: student,
    });

  } catch (err) {
    console.error("Error obteniendo todos los studentes", err);
    res.status(500).send("Error obteniendo todos los students");
  } finally {
    await db.closeConnection();
  }
});


// ========== GET: student by ID ==========
router.get("/get-one-student/:student_id", async (req, res) => {
  console.log("GET one student called:", req.params.student_id);
  const db = new SqlService();

  try {
    await db.connectToDb();
    const result = await db.query(`SELECT * FROM student WHERE student_id = ?`, [
      req.params.student_id,
    ]);

    if (result.length === 0) {
      return res.status(404).send("student no encontrado");
    }

    res.status(200).json(result[0]);
  } catch (err) {
    console.error("Error reciviendo información del student", err);
    res.status(500).send("Error reciviendo información del student");
  } finally {
    await db.closeConnection();
  }
});