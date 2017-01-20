# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160525210345) do

  create_table "acciones", primary_key: "ACC_CODIGO", force: :cascade do |t|
    t.string "ACC_NOMBRE", limit: 50, null: false
  end

  create_table "auditoria", primary_key: "AUS_CODIGO", force: :cascade do |t|
    t.string  "AUS_ACCION", limit: 50
    t.string  "AUS_TABLA",  limit: 50
    t.integer "AUS_LLAVE",  limit: 4
    t.string  "AUS_FECHA",  limit: 50
    t.string  "AUS_HORA",   limit: 50
    t.integer "USU_CODIGO", limit: 4
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id",    limit: 4
    t.string   "auditable_type",  limit: 255
    t.integer  "associated_id",   limit: 4
    t.string   "associated_type", limit: 255
    t.integer  "user_id",         limit: 4
    t.string   "user_type",       limit: 255
    t.string   "username",        limit: 255
    t.string   "action",          limit: 255
    t.text     "audited_changes", limit: 65535
    t.integer  "version",         limit: 4,     default: 0
    t.string   "comment",         limit: 255
    t.string   "remote_address",  limit: 255
    t.string   "request_uuid",    limit: 255
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "backups", primary_key: "BAC_CODIGO", force: :cascade do |t|
    t.string   "BAC_ARCHIVO", limit: 50,  null: false
    t.datetime "BAC_HASTA",               null: false
    t.string   "BAC_CLAVE",   limit: 100
    t.integer  "EMP_CODIGO",  limit: 4,   null: false
  end

  create_table "ciudades", primary_key: "CIU_CODIGO", force: :cascade do |t|
    t.string  "CIU_NOMBRE",     limit: 50
    t.integer "PRO_CODIGO",     limit: 4
    t.integer "CIU_RDEPCODIGO", limit: 4,  default: 0, null: false
    t.string  "CIU_INEC",       limit: 2,              null: false
    t.integer "CIU_NUMERO",     limit: 4,  default: 0
  end

  create_table "ciudadestmp", id: false, force: :cascade do |t|
    t.string  "CIU_INEC",   limit: 2
    t.string  "CIU_NOMBRE", limit: 33
    t.integer "PRO_INEC",   limit: 4
  end

  create_table "cursos", primary_key: "CUR_CODIGO", force: :cascade do |t|
    t.integer "USU_CODIGO",      limit: 4,                      null: false
    t.text    "CUR_DESCRIPCION", limit: 4294967295,             null: false
    t.integer "CUR_ESTADO",      limit: 4,          default: 1, null: false
  end

  create_table "empresas", primary_key: "EMP_CODIGO", force: :cascade do |t|
    t.string  "EMP_LOGO",           limit: 255
    t.string  "EMP_RUC",            limit: 20,                                                    null: false
    t.string  "EMP_NOMBRE",         limit: 250,                                                   null: false
    t.string  "EMP_NCOMERCIAL",     limit: 250
    t.string  "EMP_DIRECCION",      limit: 200,                                                   null: false
    t.string  "EMP_TELEFONO",       limit: 20,                                                    null: false
    t.string  "EMP_EMAIL",          limit: 200,                                                   null: false
    t.integer "EMP_TIPOIDREP",      limit: 4
    t.string  "EMP_IDREP",          limit: 50
    t.string  "EMP_RUCCONTADOR",    limit: 50
    t.string  "EMP_BASE",           limit: 50,                                                    null: false
    t.string  "EMP_BARCODE",        limit: 100
    t.string  "EMP_PATH",           limit: 250
    t.string  "EMP_PATHWEB",        limit: 250
    t.string  "EMP_PATHBD",         limit: 150
    t.string  "EMP_IPWEB",          limit: 50
    t.integer "EMP_INVENTARIOS",    limit: 4
    t.string  "EMP_TRANSPARENCIA",  limit: 250
    t.text    "EMP_PROFORMA",       limit: 65535
    t.integer "EMP_PRECISION",      limit: 4,                              default: 2
    t.integer "EMP_KARDEX",         limit: 4,                              default: 0
    t.integer "EMP_TSESION",        limit: 4,                                                     null: false
    t.integer "EMP_DISTINGUIR",     limit: 4,                              default: 1,            null: false
    t.integer "EMP_PREGIMP",        limit: 4,                              default: 1,            null: false
    t.integer "TAG_CODIGO",         limit: 4
    t.integer "EMP_PRECIOSIVA",     limit: 4,                              default: 0
    t.integer "EMP_ADICIONAR",      limit: 4,                              default: 1
    t.string  "EMP_IPROFORMA",      limit: 50,                                                    null: false
    t.integer "EMP_MAYUSCULAS",     limit: 4,                              default: 1
    t.integer "EMP_CUOTASC",        limit: 4,                              default: 1
    t.integer "EMP_CUOTASV",        limit: 4,                              default: 1
    t.integer "EMP_IMGMOBILE",      limit: 4,                              default: 1
    t.integer "EMP_MOVUNICO",       limit: 4,                              default: 0
    t.integer "EMP_AUDITORIA",      limit: 4,                              default: 1
    t.integer "EMP_IDIOMAS",        limit: 4,                              default: 0,            null: false
    t.integer "IMP_CODIGO",         limit: 4
    t.integer "EMP_STOCKMIN",       limit: 4,                              default: 2,            null: false
    t.integer "EMP_STOCKMAX",       limit: 4,                              default: 10,           null: false
    t.integer "EMP_RETENCIONC",     limit: 4,                              default: 1,            null: false
    t.integer "EMP_RETENCIONV",     limit: 4,                              default: 1,            null: false
    t.integer "EMP_UNICO",          limit: 4,                              default: 0,            null: false
    t.integer "EMP_ORDEN",          limit: 4,                                                     null: false
    t.integer "EMP_CCOSTOS",        limit: 4,                              default: 0,            null: false
    t.integer "EMP_PAGOSC",         limit: 4,                              default: 1,            null: false
    t.integer "EMP_COBROSC",        limit: 4,                              default: 1,            null: false
    t.integer "EMP_COSTOVENTAS",    limit: 4,                              default: 1,            null: false
    t.string  "EMP_MODULOS",        limit: 250,                            default: "ALLTHETOYS", null: false
    t.string  "EMP_CODCREDITO",     limit: 7,                                                     null: false
    t.text    "EMP_TRANSFERENCIA",  limit: 65535,                                                 null: false
    t.integer "EMP_CODINTERNO",     limit: 4,                                                     null: false
    t.integer "EMP_RECONSTRUCCION", limit: 4,                                                     null: false
    t.integer "EMP_VENDEDOR",       limit: 4,                              default: 0,            null: false
    t.string  "EMP_DIASBACKUP",     limit: 200,                                                   null: false
    t.integer "EMP_HORABACKUP",     limit: 4,                                                     null: false
    t.integer "EMP_MINBACKUP",      limit: 4,                                                     null: false
    t.string  "EMP_UBIBACKUP",      limit: 500,                                                   null: false
    t.integer "EMP_CONSIGNACION",   limit: 4,                              default: 0,            null: false
    t.integer "EMP_SOLCANVENTAS",   limit: 4,                              default: 0,            null: false
    t.integer "EMP_ESTADO",         limit: 4,                              default: 1,            null: false
    t.integer "EMP_MODFACTURACION", limit: 4
    t.integer "EMP_MODNCREDITO",    limit: 4,                                                     null: false
    t.integer "EMP_MODNDEBITO",     limit: 4,                                                     null: false
    t.integer "EMP_MODRETENCION",   limit: 4,                                                     null: false
    t.integer "EMP_MODGUIA",        limit: 4,                                                     null: false
    t.integer "EMP_TIPO_AMBIENTE",  limit: 4,                                                     null: false
    t.integer "EMP_NUM_INTENTOS",   limit: 4,                                                     null: false
    t.integer "EMP_MODENVIO",       limit: 4,                                                     null: false
    t.integer "EMP_SECINDEFINIDO",  limit: 4,                              default: 0,            null: false
    t.string  "EMP_URLPRUEBAS",     limit: 150,                            default: "",           null: false
    t.string  "EMP_URLPRODUCCION",  limit: 150,                            default: "",           null: false
    t.string  "EMP_RUTAWEBVENFE",   limit: 150,                            default: "",           null: false
    t.integer "EMP_ENVIOEMAIL",     limit: 4,                                                     null: false
    t.integer "EMP_TIMEOUTFE",      limit: 4,                              default: 5,            null: false
    t.string  "EMP_CONTRIBUYENTE",  limit: 13,                                                    null: false
    t.integer "EMP_CREDITOS",       limit: 4,                              default: 0,            null: false
    t.decimal "EMP_LIMCREDITO",                   precision: 38, scale: 2, default: 0.0,          null: false
    t.integer "EMP_CLIPRO",         limit: 4,                              default: 0,            null: false
    t.decimal "EMP_CONFINAL",                     precision: 38, scale: 2, default: 200.0,        null: false
    t.integer "EMP_CARGAPOS",       limit: 4,                              default: 1,            null: false
    t.integer "EMP_TIPOLIC",        limit: 4,                              default: 1,            null: false
    t.integer "EMP_NUMUSU",         limit: 4,                              default: 0,            null: false
    t.integer "EMP_DESCUENTOG",     limit: 4,                              default: 0,            null: false
    t.text    "EMP_EMAILS",         limit: 65535,                                                 null: false
    t.decimal "EMP_ISD",                          precision: 38, scale: 2, default: 5.0,          null: false
    t.string  "EMP_BIOMETRICO",     limit: 250,                                                   null: false
    t.integer "EMP_VERIFICAR",      limit: 4,                              default: 1,            null: false
    t.integer "EMP_NUMROLES",       limit: 4,                              default: 1,            null: false
    t.integer "EMP_LISTAPRECIOS",   limit: 4,                              default: 0,            null: false
    t.integer "EMP_TRFSALIDAS",     limit: 4,                              default: 0,            null: false
    t.string  "EMP_WOOURL",         limit: 250
    t.string  "EMP_WOOAPIKEY",      limit: 100
    t.string  "EMP_WOOAPISECRET",   limit: 100
    t.integer "EMP_TALMACEN",       limit: 4,                              default: 0,            null: false
    t.string  "EMP_DACTAS",         limit: 150,                                                   null: false
    t.text    "EMP_CABACTAS",       limit: 65535,                                                 null: false
    t.text    "EMP_PIEACTAS",       limit: 65535,                                                 null: false
    t.string  "EMP_REPRESENTANTE",  limit: 250,                                                   null: false
    t.string  "EMP_RCCLAVESITIO",   limit: 150,                                                   null: false
    t.string  "EMP_RCCLAVESECRETA", limit: 150,                                                   null: false
    t.integer "EMP_SUSTENTO",       limit: 4,                              default: 0,            null: false
  end

  add_index "empresas", ["EMP_BASE"], name: "IX_BASE", unique: true, using: :btree
  add_index "empresas", ["EMP_CODCREDITO"], name: "EMP_CODCREDITO", using: :btree

  create_table "iva", primary_key: "IVA_CODIGO", force: :cascade do |t|
    t.string   "IVA_NOMBRE",      limit: 100
    t.string   "IVA_DESCRIPCION", limit: 200
    t.decimal  "IVA_VALOR",                   precision: 38, scale: 4
    t.datetime "IVA_DESDE"
    t.datetime "IVA_HASTA"
    t.integer  "IVA_ESTADO",      limit: 4
    t.integer  "IVA_SRI",         limit: 4,                            default: 0, null: false
    t.integer  "IVA_TIPO",        limit: 4,                                        null: false
  end

  create_table "jornada", primary_key: "JOR_CODIGO", force: :cascade do |t|
    t.string  "JOR_NOMBRE",     limit: 100
    t.integer "JOR_LABORABLES", limit: 4
    t.integer "JOR_DESCANSO",   limit: 4
    t.integer "JOR_ESTADO",     limit: 4,   default: 1, null: false
  end

  create_table "localempresa", primary_key: "LEM_CODIGO", force: :cascade do |t|
    t.integer "LOC_CODIGO", limit: 4, null: false
    t.integer "EMP_CODIGO", limit: 4, null: false
  end

  add_index "localempresa", ["EMP_CODIGO", "LOC_CODIGO"], name: "unico_local_empresa", unique: true, using: :btree
  add_index "localempresa", ["EMP_CODIGO"], name: "fk_localempresa_1_idx", using: :btree
  add_index "localempresa", ["LOC_CODIGO"], name: "fk_localempresa_2_idx", using: :btree

  create_table "locales", primary_key: "LOC_CODIGO", force: :cascade do |t|
    t.integer "LOC_CIUDAD",    limit: 4,               null: false
    t.string  "LOC_NOMBRE",    limit: 200,             null: false
    t.string  "LOC_DIRECCION", limit: 200,             null: false
    t.string  "LOC_TELEFONO",  limit: 15,              null: false
    t.string  "LOC_GERENTE",   limit: 50,              null: false
    t.integer "LOC_TIPO",      limit: 4,               null: false
    t.integer "LOC_CLASE",     limit: 4,   default: 1, null: false
    t.integer "LOC_PERTENECE", limit: 4,   default: 1, null: false
    t.integer "LOC_KARDEX",    limit: 4,   default: 0
    t.string  "LOC_SIGLAS",    limit: 13,              null: false
    t.integer "LOC_ESTADO",    limit: 4,   default: 1, null: false
    t.string  "LOC_SIGLASBOD", limit: 5,               null: false
    t.integer "LOC_WEB",       limit: 4,   default: 0, null: false
  end

  create_table "nivelestudio", primary_key: "NIV_CODIGO", force: :cascade do |t|
    t.string  "NIV_DESCRIPCION", limit: 22,             null: false
    t.integer "NIV_ESTADO",      limit: 4,  default: 1, null: false
  end

  create_table "operadorast", primary_key: "OPE_CODIGO", force: :cascade do |t|
    t.string  "OPE_DESCRIPCION", limit: 11, null: false
    t.integer "OPE_ESTADO",      limit: 4,  null: false
  end

  create_table "paises", primary_key: "PAI_CODIGO", force: :cascade do |t|
    t.string  "PAI_NOMBRE",        limit: 50
    t.integer "PAI_INTERNACIONAL", limit: 4,  default: 0, null: false
  end

  create_table "provincias", primary_key: "PRO_CODIGO", force: :cascade do |t|
    t.string  "PRO_NOMBRE",     limit: 50
    t.integer "PAI_CODIGO",     limit: 4
    t.integer "PRO_RDEPCODIGO", limit: 4,  default: 0, null: false
    t.string  "PRO_INEC",       limit: 2,              null: false
  end

  create_table "rolparametros", primary_key: "RPA_CODIGO", force: :cascade do |t|
    t.integer  "EMP_CODIGO",     limit: 4,                          null: false
    t.integer  "RPA_DIAS",       limit: 4,                          null: false
    t.decimal  "RPA_PEXTRAS",              precision: 38, scale: 4, null: false
    t.decimal  "RPA_PSUPLE",               precision: 38, scale: 4, null: false
    t.decimal  "RPA_NOCTURNA",             precision: 38, scale: 4, null: false
    t.decimal  "RPA_APERSONAL",            precision: 38, scale: 4, null: false
    t.decimal  "RPA_APATRONAL",            precision: 38, scale: 4, null: false
    t.integer  "RPA_VACACIONES", limit: 4,                          null: false
    t.integer  "RPA_DTPAGO",     limit: 4,                          null: false
    t.datetime "RPA_DTDESDE",                                       null: false
    t.datetime "RPA_DTHASTA",                                       null: false
    t.integer  "RPA_DCPAGO",     limit: 4,                          null: false
    t.datetime "RPA_DCDESDE",                                       null: false
    t.datetime "RPA_DCHASTA",                                       null: false
    t.integer  "RPA_HORAS",      limit: 4,                          null: false
    t.decimal  "RPA_SBU",                  precision: 38, scale: 4, null: false
    t.integer  "RPA_DTPMENSUAL", limit: 4,                          null: false
    t.integer  "RPA_DCPMENSUAL", limit: 4,                          null: false
    t.time     "RPA_NDESDE",                                        null: false
    t.time     "RPA_NHASTA",                                        null: false
    t.decimal  "RPA_PMULTA",               precision: 38, scale: 4, null: false
    t.decimal  "RPA_PANTICIPOS",           precision: 38, scale: 4, null: false
    t.integer  "RPA_TATRASO",    limit: 4,                          null: false
    t.integer  "RPA_MATRASO",    limit: 4,                          null: false
    t.integer  "RPA_TSALIDA",    limit: 4,                          null: false
    t.integer  "RPA_MSALIDA",    limit: 4,                          null: false
    t.integer  "RPA_MSUPLE",     limit: 4,                          null: false
    t.integer  "RPA_TMSUPLE",    limit: 4,                          null: false
    t.integer  "RPA_MEXTRA",     limit: 4,                          null: false
    t.integer  "RPA_UPAGO",      limit: 4,                          null: false
    t.datetime "RPA_UDESDE",                                        null: false
    t.datetime "RPA_UHASTA",                                        null: false
    t.decimal  "RPA_USINCARGA",            precision: 38, scale: 4, null: false
    t.decimal  "RPA_UCARGA",               precision: 38, scale: 4, null: false
  end

  add_index "rolparametros", ["EMP_CODIGO"], name: "FK_ROL_PARAMETROS_EMPRESAS", using: :btree

  create_table "subtipos", primary_key: "SUB_CODIGO", force: :cascade do |t|
    t.string  "SUB_VALOR",  limit: 100
    t.integer "TIP_CODIGO", limit: 4
    t.string  "SUB_GRUPO",  limit: 50
    t.integer "SUB_ORDEN",  limit: 4
    t.integer "SUB_ESTADO", limit: 4,   default: 1
  end

  create_table "tabla_ir", primary_key: "TIR_CODIGO", force: :cascade do |t|
    t.integer "TIR_ANIO",    limit: 4,                          null: false
    t.decimal "TIR_BASE",              precision: 38, scale: 4, null: false
    t.decimal "TIR_EXCESO",            precision: 38, scale: 4, null: false
    t.decimal "TIR_IBASE",             precision: 38, scale: 4, null: false
    t.decimal "TIR_IEXCESO",           precision: 38, scale: 4, null: false
  end

  create_table "telefonosp", primary_key: "TEP_CODIGO", force: :cascade do |t|
    t.text    "TEP_DESCRIPCION", limit: 65535,             null: false
    t.string  "TEP_NUMERO",      limit: 20
    t.integer "TEP_TIPO",        limit: 4,     default: 1
    t.integer "TEP_ESTADO",      limit: 4,     default: 1, null: false
    t.integer "USU_CODIGO",      limit: 4,                 null: false
  end

  add_index "telefonosp", ["USU_CODIGO"], name: "TELEFONOSP_USUARIOS", using: :btree

  create_table "tipoestadocivil", primary_key: "TCL_CODIGO", force: :cascade do |t|
    t.string  "TCL_NOMBRE", limit: 20,             null: false
    t.integer "TCL_ESTADO", limit: 4,  default: 1, null: false
  end

  create_table "titulos", primary_key: "TIT_CODIGO", force: :cascade do |t|
    t.string  "TIT_DESCRIPCION", limit: 250,             null: false
    t.integer "TIT_ESTADO",      limit: 4,   default: 1, null: false
  end

  create_table "usuarios", primary_key: "USU_CODIGO", force: :cascade do |t|
    t.string   "USU_NOMBRES",            limit: 250
    t.string   "USU_APELLIDOS",          limit: 250
    t.string   "USU_IDSESION",           limit: 50,                null: false
    t.string   "USU_PASSWORD",           limit: 50,                null: false
    t.string   "USU_CEDULA",             limit: 50
    t.datetime "USU_FCREACION"
    t.datetime "USU_FNACIMIENTO",                                  null: false
    t.string   "USU_DIRECCION",          limit: 250
    t.string   "USU_NUMERO",             limit: 45
    t.string   "USU_TELEFONO",           limit: 50
    t.string   "USU_CELULAR1",           limit: 50
    t.string   "USU_CELULAR2",           limit: 50
    t.string   "USU_EMAIL",              limit: 50
    t.string   "USU_TIPO",               limit: 10
    t.string   "USU_FIRMA",              limit: 250
    t.integer  "CIU_CODIGO",             limit: 4
    t.string   "IDE_CODIGO",             limit: 2,   default: "2", null: false
    t.string   "USU_PASE",               limit: 250,               null: false
    t.integer  "USU_SEXO",               limit: 4
    t.integer  "USU_ECIVIL",             limit: 4
    t.integer  "USU_CARGAS",             limit: 4
    t.string   "USU_FOTO",               limit: 250
    t.integer  "NIV_CODIGO",             limit: 4,   default: 1
    t.integer  "TIT_CODIGO",             limit: 4,                 null: false
    t.string   "USU_TIPOSANGRE",         limit: 5,                 null: false
    t.string   "USU_CODIESS",            limit: 50
    t.integer  "CIU_ORIGEN",             limit: 4,                 null: false
    t.integer  "USU_ESTADO",             limit: 4,   default: 1,   null: false
    t.string   "encrypted_password",     limit: 255, default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "usuarios", ["USU_IDSESION", "USU_PASSWORD"], name: "IX_USUARIOS", unique: true, using: :btree

  create_table "usuarios_es", primary_key: "UES_CODIGO", force: :cascade do |t|
    t.integer  "USU_CODIGO",   limit: 4
    t.datetime "UES_FINGRESO",                                    null: false
    t.datetime "UES_FSALIDA",                                     null: false
    t.decimal  "UES_NOMINAL",            precision: 38, scale: 2
  end

  add_index "usuarios_es", ["USU_CODIGO"], name: "FK_USUARIOS_ES_USUARIOS", using: :btree

  create_table "usuarios_locales", primary_key: "ULO_CODIGO", force: :cascade do |t|
    t.integer "USU_CODIGO", limit: 4,                  null: false
    t.string  "ULO_TIPO",   limit: 50, default: "USU"
    t.integer "LEM_CODIGO", limit: 4
  end

  add_index "usuarios_locales", ["LEM_CODIGO"], name: "fk_usuarios_locales_2_idx", using: :btree
  add_index "usuarios_locales", ["USU_CODIGO"], name: "FK_USUARIOS_LOCALES_USUARIOS", using: :btree

  create_table "zonase", primary_key: "ZON_CODIGO", force: :cascade do |t|
    t.string  "ZON_NOMBRE", limit: 250,             null: false
    t.integer "ZON_ESTADO", limit: 4,   default: 1, null: false
  end

  add_foreign_key "localempresa", "empresas", column: "EMP_CODIGO", primary_key: "EMP_CODIGO", name: "fk_localempresa_1"
  add_foreign_key "localempresa", "locales", column: "LOC_CODIGO", primary_key: "LOC_CODIGO", name: "fk_localempresa_2"
  add_foreign_key "telefonosp", "usuarios", column: "USU_CODIGO", primary_key: "USU_CODIGO", name: "telefonosp_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "usuarios_es", "usuarios", column: "USU_CODIGO", primary_key: "USU_CODIGO", name: "usuarios_es_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "usuarios_locales", "localempresa", column: "LEM_CODIGO", primary_key: "LEM_CODIGO", name: "fk_usuarios_locales_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "usuarios_locales", "usuarios", column: "USU_CODIGO", primary_key: "USU_CODIGO", name: "FK_USUARIOS_LOCALES_USUARIOS"
end
