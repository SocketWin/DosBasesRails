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

ActiveRecord::Schema.define(version: 20161219150732) do

  create_table "abonoscompras", primary_key: "ABC_CODIGO", force: :cascade do |t|
    t.integer  "PCO_CODIGO",    limit: 4,                                       null: false
    t.integer  "EGR_CODIGO",    limit: 4
    t.decimal  "ABC_VALOR",                precision: 38, scale: 4,             null: false
    t.datetime "ABC_FECHA",                                                     null: false
    t.string   "ABC_TIPOPAGO",  limit: 50,                                      null: false
    t.string   "ABC_ORIGEN",    limit: 50
    t.integer  "ABC_FASOCIADO", limit: 4
    t.integer  "ABC_ESTADO",    limit: 4,                           default: 1, null: false
  end

  add_index "abonoscompras", ["EGR_CODIGO"], name: "ABC_EGRESOS", using: :btree
  add_index "abonoscompras", ["PCO_CODIGO"], name: "FK_ABONOS_COMPRAS_PAGOS_COMPRAS", using: :btree

  create_table "abonosventas", primary_key: "ABV_CODIGO", force: :cascade do |t|
    t.integer  "PVE_CODIGO",    limit: 4,                                       null: false
    t.integer  "ING_CODIGO",    limit: 4
    t.decimal  "ABV_VALOR",                precision: 38, scale: 4,             null: false
    t.datetime "ABV_FECHA",                                                     null: false
    t.integer  "ABV_TIPOPAGO",  limit: 4,                                       null: false
    t.string   "ABV_ORIGEN",    limit: 50
    t.integer  "ABV_FASOCIADO", limit: 4
    t.integer  "ABV_ESTADO",    limit: 4,                           default: 1, null: false
  end

  add_index "abonosventas", ["ING_CODIGO"], name: "ABC_INGRESOS", using: :btree
  add_index "abonosventas", ["PVE_CODIGO"], name: "FK_ABONOS_PAGOS_VENTAS", using: :btree

  create_table "acciones", primary_key: "ACC_CODIGO", force: :cascade do |t|
    t.string "ACC_NOMBRE", limit: 50, null: false
  end

  create_table "acciones_org_rol", primary_key: "AOR_CODIGO", force: :cascade do |t|
    t.integer "ACC_CODIGO", limit: 4, null: false
    t.integer "ORO_CODIGO", limit: 4, null: false
  end

  add_index "acciones_org_rol", ["ACC_CODIGO"], name: "FK_ACCIONES_USUARIOS_ACCIONES", using: :btree
  add_index "acciones_org_rol", ["ORO_CODIGO"], name: "FK_ACCIONES_ORG_ROL_ORG_ROL", using: :btree

  create_table "actaer", primary_key: "AER_CODIGO", force: :cascade do |t|
    t.integer  "AER_ANIO",          limit: 4,                 null: false
    t.string   "AER_NUMERO",        limit: 9,                 null: false
    t.integer  "VEN_CODIGO",        limit: 4,                 null: false
    t.datetime "AER_FECHA",                                   null: false
    t.text     "AER_CABECERA",      limit: 65535,             null: false
    t.text     "AER_OBSERVACIONES", limit: 65535,             null: false
    t.text     "AER_PIE",           limit: 65535,             null: false
    t.integer  "AER_ESTADO",        limit: 4,     default: 1, null: false
  end

  create_table "actaer_detalle", primary_key: "AED_CODIGO", force: :cascade do |t|
    t.integer "AER_CODIGO",       limit: 4,                            null: false
    t.integer "ITE_CODIGO",       limit: 4,                            null: false
    t.string  "ITE_DESCRIPCION",  limit: 250,                          null: false
    t.decimal "AED_CANTIDAD",                 precision: 38, scale: 8, null: false
    t.string  "AED_LOTE",         limit: 100,                          null: false
    t.string  "AED_FELABORACION", limit: 50,                           null: false
    t.string  "AED_FCADUCIDAD",   limit: 50,                           null: false
  end

  add_index "actaer_detalle", ["AER_CODIGO"], name: "AER_CODIGO", using: :btree
  add_index "actaer_detalle", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree

  create_table "actafiniquito", primary_key: "ACT_CODIGO", force: :cascade do |t|
    t.integer "CON_CODIGO",     limit: 4,                              null: false
    t.decimal "ACT_ROL",                      precision: 38, scale: 2, null: false
    t.decimal "ACT_DTERCERO",                 precision: 38, scale: 2, null: false
    t.decimal "ACT_DCUARTO",                  precision: 38, scale: 2, null: false
    t.string  "ACT_OTROSDESC",  limit: 150,                            null: false
    t.decimal "ACT_OTROSVAL",                 precision: 38, scale: 2, null: false
    t.decimal "ACT_VACACIONES",               precision: 38, scale: 2, null: false
    t.text    "ACT_RAZON",      limit: 65535,                          null: false
  end

  create_table "activaciones", id: false, force: :cascade do |t|
    t.string   "ACT_CELULAR",   limit: 20,  null: false
    t.string   "ACT_PLAN",      limit: 50,  null: false
    t.string   "ACT_PLANDESC",  limit: 50,  null: false
    t.datetime "ACT_FECHA",                 null: false
    t.string   "ACT_VENDEDOR",  limit: 100, null: false
    t.string   "ACT_CIUDAD",    limit: 100, null: false
    t.string   "ACT_CLIENTE",   limit: 300, null: false
    t.string   "ACT_CEDULA",    limit: 13,  null: false
    t.string   "ACT_RUC",       limit: 13,  null: false
    t.string   "ACT_TIPOVENTA", limit: 20,  null: false
    t.string   "ACT_CANAL",     limit: 10,  null: false
    t.string   "ACT_ICC",       limit: 50,  null: false
    t.string   "ACT_TIPO",      limit: 50,  null: false
  end

  add_index "activaciones", ["ACT_CIUDAD"], name: "ACT_CIUDAD", using: :btree

  create_table "activo_usuario_ubicacion", primary_key: "AUU_CODIGO", force: :cascade do |t|
    t.string   "AFD_CODIGO",      limit: 50,              null: false
    t.integer  "USU_CODIGO",      limit: 4,               null: false
    t.integer  "LOC_CODIGO",      limit: 4,               null: false
    t.datetime "AUU_FECHA_REC",                           null: false
    t.datetime "AUU_FECHA_ENT",                           null: false
    t.string   "AUU_ESTADO_REC",  limit: 100,             null: false
    t.string   "AUU_ESTADO_ENT",  limit: 100
    t.integer  "AUU_USUARIO_ANT", limit: 4,               null: false
    t.integer  "AUU_USUARIO_SIG", limit: 4
    t.integer  "AUU_LOCAL_ANT",   limit: 4
    t.integer  "AUU_LOCAL_SIG",   limit: 4
    t.integer  "AUU_ACTIVO",      limit: 4,   default: 1, null: false
  end

  create_table "activos_fijos_bajas", primary_key: "AFB_CODIGO", force: :cascade do |t|
    t.datetime "AFB_FECHA",                     null: false
    t.string   "AFB_CAUSA",         limit: 100, null: false
    t.string   "AFB_AUTORIZADO",    limit: 50,  null: false
    t.string   "AFB_OBSERVACIONES", limit: 100, null: false
    t.string   "AFD_CODIGO",        limit: 50,  null: false
  end

  create_table "activos_fijos_detalle", primary_key: "AFD_CODIGO", force: :cascade do |t|
    t.string   "AFD_SERIE",        limit: 50
    t.datetime "AFD_FECHA_COMPRA",                        null: false
    t.integer  "PRO_CODIGO",       limit: 4,              null: false
    t.string   "AFD_CONDICION",    limit: 50
    t.integer  "AFD_ESTADO",       limit: 4,  default: 1, null: false
  end

  create_table "activos_fijos_partes", primary_key: "AFP_CODIGO", force: :cascade do |t|
    t.string  "AFP_DESCRIPCION", limit: 50, null: false
    t.integer "AFP_CANTIDAD",    limit: 4,  null: false
    t.string  "AFD_CODIGO",      limit: 50, null: false
  end

  create_table "adicionales", primary_key: "ADI_CODIGO", force: :cascade do |t|
    t.integer  "FPV_CODIGO",      limit: 4,                           null: false
    t.decimal  "ADI_CUOTA",                  precision: 38, scale: 2, null: false
    t.datetime "ADI_VENCIMIENTO",                                     null: false
    t.string   "ADI_LETRA",       limit: 50,                          null: false
    t.integer  "ADI_ESTADO",      limit: 4,                           null: false
  end

  create_table "aduanas", primary_key: "ADU_CODIGO", force: :cascade do |t|
    t.string  "ADU_NOMBRE",    limit: 50
    t.integer "ADU_CIUDAD",    limit: 4
    t.string  "ADU_DIRECCION", limit: 250
    t.string  "ADU_CONTACTO",  limit: 250
    t.string  "ADU_EMAIL",     limit: 200
    t.string  "ADU_TELEFONO",  limit: 14
    t.string  "ADU_FAX",       limit: 14
    t.integer "ADU_ESTADO",    limit: 4,   default: 1
  end

  create_table "afecciones", id: false, force: :cascade do |t|
    t.integer "ACO_AFECTA",   limit: 4,  null: false
    t.integer "ACO_AFECTADO", limit: 4,  null: false
    t.string  "ACO_TIPO",     limit: 50, null: false
  end

  create_table "agentes", primary_key: "AGE_CODIGO", force: :cascade do |t|
    t.string  "AGE_DESCRIPCION", limit: 250, null: false
    t.string  "AGE_CODAGENTE",   limit: 20,  null: false
    t.string  "AGE_RUC",         limit: 13,  null: false
    t.string  "AGE_DIRECCION",   limit: 200, null: false
    t.integer "AGE_ESTADO",      limit: 4,   null: false
  end

  create_table "antenas", primary_key: "ANT_CODIGO", force: :cascade do |t|
    t.string  "ANT_NOMBRE", limit: 100
    t.string  "ANT_IP",     limit: 100
    t.integer "ANT_ESTADO", limit: 4
    t.integer "NOD_CODIGO", limit: 4
  end

  add_index "antenas", ["ANT_IP"], name: "ANT_IP_UNIQUE", unique: true, using: :btree
  add_index "antenas", ["NOD_CODIGO"], name: "NODOS_NOD_CODIGOFK_idx", using: :btree

  create_table "anticipos", primary_key: "ANT_CODIGO", force: :cascade do |t|
    t.string   "ANT_NUMERO",    limit: 9
    t.integer  "ANT_PERTENECE", limit: 4
    t.integer  "ANT_ASOCIADO",  limit: 4
    t.integer  "ANT_FPAGO",     limit: 4
    t.string   "ANT_CONCEPTO",  limit: 250
    t.datetime "ANT_REGISTRO",                                                   null: false
    t.string   "ANT_DOCUMENTO", limit: 50
    t.decimal  "ANT_VALOR",                 precision: 38, scale: 4
    t.string   "ANT_ORIGEN",    limit: 50,                                       null: false
    t.integer  "ANT_OASOCIADO", limit: 4
    t.integer  "PTO_CODIGO",    limit: 4
    t.integer  "ANT_ESTADO",    limit: 4,                            default: 1, null: false
  end

  add_index "anticipos", ["PTO_CODIGO"], name: "PTO_CODIGO", using: :btree

  create_table "anticiposcv", primary_key: "ACV_CODIGO", force: :cascade do |t|
    t.integer "ANT_CODIGO",   limit: 4,                           null: false
    t.string  "ACV_TIPO",     limit: 45,                          null: false
    t.integer "ACV_ASOCIADO", limit: 4,                           null: false
    t.decimal "ACV_VALOR",               precision: 38, scale: 2
  end

  add_index "anticiposcv", ["ACV_CODIGO"], name: "ANTICIPOS", using: :btree
  add_index "anticiposcv", ["ACV_TIPO", "ACV_ASOCIADO", "ACV_CODIGO"], name: "UNICO", unique: true, using: :btree
  add_index "anticiposcv", ["ANT_CODIGO"], name: "ANT_CODIGO", using: :btree
  add_index "anticiposcv", ["ANT_CODIGO"], name: "ANT_CODIGO_2", using: :btree

  create_table "anticiposfecha", id: false, force: :cascade do |t|
    t.integer  "ANT_CODIGO", limit: 4,                           null: false
    t.string   "ACV_TIPO",   limit: 45,                          null: false
    t.decimal  "ACV_VALOR",             precision: 38, scale: 2
    t.datetime "ACV_FECHA"
  end

  create_table "aplicaciones", primary_key: "APL_CODIGO", force: :cascade do |t|
    t.string  "APL_DESCRIPCION",   limit: 250
    t.text    "APL_OBSERVACIONES", limit: 4294967295
    t.integer "APL_PERTENECE",     limit: 4,          default: 0
    t.integer "APL_ESTADO",        limit: 4,          default: 1
  end

  create_table "archivos", primary_key: "ARC_CODIGO", force: :cascade do |t|
    t.string  "ARC_TIPO",     limit: 100, null: false
    t.integer "ARC_ASOCIADO", limit: 4,   null: false
    t.string  "ARC_NOMBRE",   limit: 500, null: false
  end

  create_table "archivoskitbases", force: :cascade do |t|
    t.text     "descripcion",         limit: 65535
    t.integer  "kitbase_id",          limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "imagen_file_name",    limit: 255
    t.string   "imagen_content_type", limit: 255
    t.integer  "imagen_file_size",    limit: 4
    t.datetime "imagen_updated_at"
  end

  add_index "archivoskitbases", ["kitbase_id"], name: "fk_rails_3cd8b9a34d", using: :btree

  create_table "asientos", primary_key: "ASI_NUMERO", force: :cascade do |t|
    t.integer  "ASI_DIARIONRO",   limit: 4,                                               null: false
    t.datetime "ASI_FECHA",                                                               null: false
    t.text     "ASI_DESCRIPCION", limit: 4294967295,                                      null: false
    t.decimal  "ASI_TOTALDEBE",                      precision: 38, scale: 4,             null: false
    t.decimal  "ASI_TOTALHABER",                     precision: 38, scale: 4,             null: false
    t.integer  "ASI_NRODOC",      limit: 4
    t.string   "ASI_TIPO",        limit: 50
    t.integer  "ASI_NROTIPO",     limit: 4,                                               null: false
    t.integer  "LOC_CODIGO",      limit: 4
    t.integer  "ASI_ESTADO",      limit: 4,                                   default: 1, null: false
  end

  add_index "asientos", ["ASI_DIARIONRO", "ASI_TIPO", "ASI_NROTIPO", "ASI_ESTADO"], name: "IX_TIPO", unique: true, using: :btree
  add_index "asientos", ["ASI_TIPO", "ASI_NRODOC"], name: "IX_ASI_TIPO_NRODOC", using: :btree
  add_index "asientos", ["LOC_CODIGO"], name: "IX_LOC_CODIGO", using: :btree

  create_table "asignaciones", primary_key: "ASG_CODIGO", force: :cascade do |t|
    t.string  "ASG_ITEM",        limit: 20, null: false
    t.string  "ASG_TIPO",        limit: 50, null: false
    t.integer "PLA_CODIGO",      limit: 4,  null: false
    t.string  "ASG_TRANSACCION", limit: 50, null: false
  end

  create_table "auditoria", primary_key: "AUD_CODIGO", force: :cascade do |t|
    t.string  "AUD_ACCION",  limit: 400
    t.string  "AUD_TABLA",   limit: 50
    t.integer "AUD_LLAVE",   limit: 4
    t.string  "AUD_FECHA",   limit: 50
    t.string  "AUD_HORA",    limit: 50
    t.integer "AUD_USUARIO", limit: 4
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

  create_table "autorizaciones", primary_key: "AUT_CODIGO", force: :cascade do |t|
    t.string   "TIC_CODIGO",          limit: 2,              null: false
    t.string   "AUT_AUTORIZACION",    limit: 50
    t.string   "AUT_ESTABLECIMIENTO", limit: 3,              null: false
    t.string   "AUT_PTOEMISION",      limit: 3,              null: false
    t.integer  "AUT_DESDE",           limit: 4
    t.integer  "AUT_HASTA",           limit: 4
    t.datetime "AUT_CADUCIDAD",                              null: false
    t.string   "AUT_NUM_ACTUAL",      limit: 9,              null: false
    t.integer  "AUT_PERTENECE",       limit: 4
    t.integer  "AUT_ASOCIADO",        limit: 4
    t.string   "AUT_IMPRENTA",        limit: 6
    t.integer  "AUT_COMPARTIDA",      limit: 4,  default: 0
    t.integer  "AUT_ESTADO",          limit: 4,              null: false
  end

  add_index "autorizaciones", ["AUT_ESTABLECIMIENTO", "AUT_PTOEMISION", "TIC_CODIGO", "AUT_ASOCIADO", "AUT_ESTADO", "AUT_AUTORIZACION"], name: "IX_AUTORIZACIONES", unique: true, using: :btree

  create_table "backups", id: false, force: :cascade do |t|
    t.integer  "BAC_CODIGO",  limit: 4,   default: 0, null: false
    t.string   "BAC_ARCHIVO", limit: 50,              null: false
    t.datetime "BAC_HASTA",                           null: false
    t.string   "BAC_CLAVE",   limit: 100
    t.integer  "EMP_CODIGO",  limit: 4,               null: false
  end

  create_table "bancos", primary_key: "BAN_CODIGO", force: :cascade do |t|
    t.string  "BAN_NOMBRE",    limit: 200,                    null: false
    t.integer "BAN_CIUDAD",    limit: 4,                      null: false
    t.text    "BAN_DIRECCION", limit: 4294967295,             null: false
    t.string  "BAN_TELEFONO",  limit: 50,                     null: false
    t.integer "BAN_TIPO",      limit: 4,                      null: false
    t.string  "BAN_RUC",       limit: 13,                     null: false
    t.string  "BAN_ESPECIAL",  limit: 10
    t.integer "BAN_ESTADO",    limit: 4,          default: 1, null: false
  end

  create_table "beneficiados", primary_key: "BEN_CODIGO", force: :cascade do |t|
    t.integer "CLI_CODIGO", limit: 4, null: false
    t.integer "CSP_CODIGO", limit: 4, null: false
    t.integer "ITE_CODIGO", limit: 4, null: false
  end

  create_table "beneficiadositems", primary_key: "BEI_CODIGO", force: :cascade do |t|
    t.datetime "BEI_FECHA",              null: false
    t.integer  "CSP_CODIGO",   limit: 4, null: false
    t.integer  "ITE_CODIGO",   limit: 4, null: false
    t.integer  "BEI_CANTIDAD", limit: 4, null: false
    t.integer  "CLI_CODIGO",   limit: 4, null: false
  end

  create_table "boletos", primary_key: "BOL_CODIGO", force: :cascade do |t|
    t.integer "VEN_CODIGO",      limit: 4
    t.integer "BOL_NUMERO",      limit: 4
    t.string  "BOL_VERIFICADOR", limit: 45
    t.integer "ITE_CODIGO",      limit: 4,              null: false
    t.integer "BOL_ESTADO",      limit: 4,  default: 1
  end

  add_index "boletos", ["BOL_VERIFICADOR"], name: "IX_VERIFICADOR", unique: true, using: :btree
  add_index "boletos", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree
  add_index "boletos", ["VEN_CODIGO"], name: "FK_BOLETOS_VENTAS_idx", using: :btree
  add_index "boletos", ["VEN_CODIGO"], name: "IX_VEN_CODIGO", using: :btree

  create_table "botones", primary_key: "BOT_CODIGO", force: :cascade do |t|
    t.string  "BOT_DESCRIPCION", limit: 50,              null: false
    t.string  "BOT_IMAGEN",      limit: 100,             null: false
    t.integer "BOT_MOVIL",       limit: 4,   default: 0, null: false
  end

  add_index "botones", ["BOT_DESCRIPCION"], name: "BOT_DESCRIPCION", using: :btree

  create_table "boveda", id: false, force: :cascade do |t|
    t.integer "EGR_CODIGO",  limit: 4,             null: false
    t.integer "BOV_ORIGEN",  limit: 4,             null: false
    t.integer "BOV_DESTINO", limit: 4,             null: false
    t.integer "BOV_100",     limit: 4,             null: false
    t.integer "BOV_50",      limit: 4,             null: false
    t.integer "BOV_20",      limit: 4,             null: false
    t.integer "BOV_10",      limit: 4,             null: false
    t.integer "BOV_5",       limit: 4,             null: false
    t.integer "BOV_1",       limit: 4,             null: false
    t.integer "BOV_050",     limit: 4,             null: false
    t.integer "BOV_025",     limit: 4,             null: false
    t.integer "BOV_010",     limit: 4,             null: false
    t.integer "BOV_005",     limit: 4,             null: false
    t.integer "BOV_001",     limit: 4,             null: false
    t.integer "BOV_ESTADO",  limit: 4, default: 1, null: false
  end

  create_table "calendarios", primary_key: "CAL_CODIGO", force: :cascade do |t|
    t.datetime "CAL_FECHA",                   null: false
    t.string   "CAL_DESCRIPCION", limit: 128
    t.integer  "ECA_CODIGO",      limit: 4,   null: false
    t.integer  "USU_CODIGO",      limit: 4,   null: false
    t.integer  "HOR_CODIGO",      limit: 4,   null: false
    t.datetime "VAC_INIPERIODO",              null: false
  end

  create_table "caracteristicas", primary_key: "CAR_CODIGO", force: :cascade do |t|
    t.string  "CAR_NOMBRE", limit: 250
    t.integer "CAR_ESTADO", limit: 4,   default: 0
  end

  add_index "caracteristicas", ["CAR_NOMBRE"], name: "CAR_NOMBRE_UNIQUE", unique: true, using: :btree

  create_table "ccdetalle", primary_key: "CCD_CODIGO", force: :cascade do |t|
    t.integer "CCA_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "CCD_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "ccdetalle", ["CCA_CODIGO"], name: "FK_CCA_DETALLE", using: :btree

  create_table "certificado_digital", primary_key: "CTD_CODIGO", force: :cascade do |t|
    t.string   "CTD_NOMBRE",     limit: 200, null: false
    t.string   "CTD_PASSWORD",   limit: 100, null: false
    t.datetime "CTD_FCADUCIDAD",             null: false
    t.integer  "CTD_ESTADO",     limit: 4,   null: false
  end

  create_table "cheques", primary_key: "CHE_CODIGO", force: :cascade do |t|
    t.string   "CHE_NUMERO",      limit: 50,                                          null: false
    t.datetime "CHE_FREGISTRO"
    t.datetime "CHE_FCOBRO",                                                          null: false
    t.integer  "CBA_CODIGO",      limit: 4,                                           null: false
    t.string   "CHE_TRANSACCION", limit: 50,                                          null: false
    t.integer  "CHE_FPAGO",       limit: 4
    t.integer  "CHE_PAGOS",       limit: 4
    t.decimal  "CHE_VALOR",                   precision: 38, scale: 4
    t.string   "FPS_CODIGO",      limit: 2,                            default: "00", null: false
    t.integer  "CHE_ESTADO",      limit: 4,                            default: 102,  null: false
    t.string   "CHE_AFAVOR",      limit: 250
  end

  create_table "ciudades", id: false, force: :cascade do |t|
    t.integer "CIU_CODIGO",     limit: 4,  default: 0, null: false
    t.string  "CIU_NOMBRE",     limit: 50
    t.integer "PRO_CODIGO",     limit: 4
    t.integer "CIU_RDEPCODIGO", limit: 4,  default: 0, null: false
    t.string  "CIU_INEC",       limit: 2,              null: false
    t.integer "CIU_NUMERO",     limit: 4,  default: 0
  end

  create_table "claves_acceso", primary_key: "CLA_CODIGO", force: :cascade do |t|
    t.string  "CLA_CLAVE",          limit: 50,  default: "", null: false
    t.string  "CLA_FECHA",          limit: 100,              null: false
    t.integer "CLA_ESTADO",         limit: 4,                null: false
    t.integer "CLA_ESTADOSRI",      limit: 4,                null: false
    t.integer "CLA_SUBIDAWEB",      limit: 4,   default: 0,  null: false
    t.integer "CLA_CODCOMPROBANTE", limit: 4,                null: false
  end

  add_index "claves_acceso", ["CLA_CLAVE"], name: "CLA_CLAVE", unique: true, using: :btree
  add_index "claves_acceso", ["CLA_CODIGO"], name: "CLA_CODIGO", using: :btree

  create_table "claves_contingencia", primary_key: "CLA_CODIGO", force: :cascade do |t|
    t.string  "CLA_VALOR",  limit: 200, null: false
    t.integer "CLA_ESTADO", limit: 4,   null: false
  end

  create_table "cliente_contrato", primary_key: "CCR_CODIGO", force: :cascade do |t|
    t.integer "CVV_CODIGO", limit: 4, null: false
    t.integer "CLI_CODIGO", limit: 4, null: false
  end

  create_table "clientegrupo", id: false, force: :cascade do |t|
    t.integer "CLI_CODIGO", limit: 4, null: false
    t.integer "GRU_CODIGO", limit: 4, null: false
  end

  add_index "clientegrupo", ["CLI_CODIGO"], name: "CLI_CODIGO", using: :btree
  add_index "clientegrupo", ["GRU_CODIGO"], name: "GRU_CODIGO", using: :btree

  create_table "clientelinea", id: false, force: :cascade do |t|
    t.integer "CLI_CODIGO", limit: 4, null: false
    t.integer "LIN_CODIGO", limit: 4, null: false
  end

  add_index "clientelinea", ["CLI_CODIGO"], name: "CLI_CODIGO", using: :btree
  add_index "clientelinea", ["LIN_CODIGO"], name: "LIN_CODIGO", using: :btree

  create_table "clientemarca", id: false, force: :cascade do |t|
    t.integer "CLI_CODIGO", limit: 4, null: false
    t.integer "MAR_CODIGO", limit: 4, null: false
  end

  add_index "clientemarca", ["CLI_CODIGO"], name: "CLI_CODIGO", using: :btree
  add_index "clientemarca", ["MAR_CODIGO"], name: "MAR_CODIGO", using: :btree

  create_table "clientes", primary_key: "CLI_CODIGO", force: :cascade do |t|
    t.string   "CLI_TIPOIDE",        limit: 2,                                   default: "1",        null: false
    t.string   "CLI_IDENTIFICACION", limit: 15,                                                       null: false
    t.datetime "CLI_FREGISTRO"
    t.string   "CLI_NOMBRE",         limit: 250,                                                      null: false
    t.string   "CLI_RCOMERCIAL",     limit: 250
    t.string   "CLI_DIRECCION",      limit: 250,                                                      null: false
    t.string   "CLI_TELEFONO",       limit: 15
    t.string   "CLI_FAX",            limit: 15
    t.string   "CLI_CELULAR",        limit: 16
    t.string   "CLI_EMAIL",          limit: 500
    t.integer  "CLI_UBICACION",      limit: 4
    t.integer  "CLI_CLASIFICACION",  limit: 4
    t.integer  "CLI_DIASCREDITO",    limit: 4
    t.decimal  "CLI_LIMCREDITO",                        precision: 38, scale: 4
    t.string   "CLI_ATEVENTAS",      limit: 200
    t.string   "CLI_ATECOBRANZA",    limit: 200
    t.integer  "CLI_VENDEDOR",       limit: 4
    t.string   "CLI_REVISIONPAGO",   limit: 200
    t.decimal  "CLI_DESCUENTO",                         precision: 38, scale: 4
    t.decimal  "CLI_SALDO",                             precision: 38, scale: 4
    t.decimal  "CLI_VANUALES",                          precision: 38, scale: 4
    t.datetime "CLI_FUPAGO",                                                                          null: false
    t.string   "CLI_DUPAGO",         limit: 50
    t.decimal  "CLI_MONTOPAGO",                         precision: 38, scale: 4
    t.datetime "CLI_FUVENTA",                                                                         null: false
    t.string   "CLI_DUVENTA",        limit: 50
    t.decimal  "CLI_MONTOVENTA",                        precision: 38, scale: 4
    t.text     "CLI_OBSERVACIONES",  limit: 4294967295
    t.datetime "CLI_FNACIMIENTO",                                                                     null: false
    t.integer  "CLI_ECIVIL",         limit: 4
    t.integer  "CLI_SEXO",           limit: 4
    t.integer  "CLI_ESTUDIOS",       limit: 4
    t.string   "CLI_PROFESION",      limit: 250
    t.integer  "CLI_LABORAL",        limit: 4
    t.string   "CLI_EMPRESA",        limit: 250
    t.integer  "CLI_TIPOEMPRESA",    limit: 4
    t.string   "CLI_WEB",            limit: 250
    t.integer  "CLI_DESEMPENO",      limit: 4
    t.integer  "TAG_CODIGO",         limit: 4,                                                        null: false
    t.integer  "TCL_CODIGO",         limit: 4,                                                        null: false
    t.integer  "CLI_DISCAPACIDAD",   limit: 4,                                                        null: false
    t.string   "ZON_CODIGO",         limit: 4
    t.integer  "CLI_CONTRIBUYENTE",  limit: 4,                                   default: 0,          null: false
    t.integer  "CLI_ESTADO",         limit: 4,                                   default: 1,          null: false
    t.integer  "CLI_RELACIONADA",    limit: 4,                                   default: 0,          null: false
    t.integer  "CLI_INTEGRANTES",    limit: 4,                                   default: 0,          null: false
    t.string   "CLI_REFERENCIA",     limit: 250,                                 default: "",         null: false
    t.string   "CLI_NODO",           limit: 100,                                 default: "",         null: false
    t.string   "CLI_BASE",           limit: 100,                                 default: "",         null: false
    t.string   "CLI_DHCP",           limit: 20,                                  default: "DINAMICA", null: false
    t.string   "CLI_IP",             limit: 100,                                 default: "",         null: false
    t.string   "CLI_USUARIO",        limit: 100,                                 default: "",         null: false
    t.string   "CLI_PASSWORD",       limit: 100,                                 default: "",         null: false
    t.string   "CLI_SERVICIO",       limit: 100,                                 default: "",         null: false
    t.string   "CLI_REGISTRADO",     limit: 100,                                 default: "",         null: false
    t.string   "CLI_LATITUD",        limit: 100,                                 default: "",         null: false
    t.string   "CLI_LONGITUD",       limit: 100,                                 default: "",         null: false
    t.decimal  "CLI_ALTITUD",                           precision: 38, scale: 2, default: 0.0,        null: false
  end

  add_index "clientes", ["CLI_IDENTIFICACION"], name: "IX_CLIENTES", unique: true, using: :btree
  add_index "clientes", ["TCL_CODIGO"], name: "TCL_CODIGO", using: :btree
  add_index "clientes", ["ZON_CODIGO"], name: "ZON_CODIGO", using: :btree

  create_table "clientesporcobrar", id: false, force: :cascade do |t|
    t.integer  "CLI_CODIGO",          limit: 4,                            default: 0,   null: false
    t.string   "CLI_IDENTIFICACION",  limit: 15,                                         null: false
    t.string   "CLI_NOMBRE",          limit: 250,                                        null: false
    t.string   "CLI_DIRECCION",       limit: 250,                                        null: false
    t.string   "CLI_TELEFONO",        limit: 15
    t.string   "CLI_EMAIL",           limit: 500
    t.integer  "CLI_UBICACION",       limit: 4
    t.string   "CLI_EMPRESA",         limit: 250
    t.integer  "LOC_CODIGO",          limit: 4,                                          null: false
    t.integer  "VEN_CODIGO",          limit: 4,                            default: 0,   null: false
    t.string   "VEN_ESTABLECIMIENTO", limit: 3,                                          null: false
    t.string   "VEN_PTOEMISION",      limit: 3,                                          null: false
    t.string   "VEN_NUMERO",          limit: 9,                                          null: false
    t.datetime "VEN_FECHA"
    t.string   "VEN_TIPODOC",         limit: 20,                                         null: false
    t.decimal  "VEN_TOTAL",                       precision: 38, scale: 4,               null: false
    t.integer  "FPV_CODIGO",          limit: 4,                            default: 0,   null: false
    t.decimal  "FPV_VALOR",                       precision: 38, scale: 4,               null: false
    t.integer  "PVE_CODIGO",          limit: 4,                            default: 0,   null: false
    t.datetime "PVE_VENCIMIENTO",                                                        null: false
    t.decimal  "CUOTA",                           precision: 60, scale: 4
    t.decimal  "COBRO",                           precision: 61, scale: 4, default: 0.0, null: false
  end

  create_table "codigosaut", primary_key: "CDA_CODIGO", force: :cascade do |t|
    t.datetime "CDA_REGISTRO",                            null: false
    t.integer  "MEN_CODIGO",      limit: 4,               null: false
    t.integer  "USU_CODIGO",      limit: 4,               null: false
    t.integer  "CDA_TIPO",        limit: 4
    t.integer  "CDA_ASOCIADO",    limit: 4
    t.datetime "CDA_FECHAUSO"
    t.integer  "CDA_USUARIO",     limit: 4
    t.string   "CDA_VERIFICADOR", limit: 10, default: "", null: false
  end

  add_index "codigosaut", ["CDA_ASOCIADO"], name: "CDA_ASOCIADO", using: :btree
  add_index "codigosaut", ["CDA_TIPO"], name: "CDA_TIPO", using: :btree
  add_index "codigosaut", ["CDA_USUARIO"], name: "CDA_USUARIO", using: :btree
  add_index "codigosaut", ["CDA_VERIFICADOR"], name: "CDA_VERIFICADOR", using: :btree
  add_index "codigosaut", ["USU_CODIGO"], name: "USU_CODIGO", using: :btree

  create_table "combinaciones", primary_key: "CMB_CODIGO", force: :cascade do |t|
    t.string  "CMB_NUMERO",        limit: 20,                           null: false
    t.string  "CMB_DESCRIPCION",   limit: 200,                          null: false
    t.integer "CMB_RESULTADOCOD",  limit: 4,                            null: false
    t.string  "CMB_RESULTADODES",  limit: 200,                          null: false
    t.integer "CMB_COMPONENTECOD", limit: 4,                            null: false
    t.string  "CMB_COMPONENTEBAR", limit: 50,                           null: false
    t.string  "CMB_COMPONENTEDES", limit: 200,                          null: false
    t.decimal "CMB_PROPORCION",                precision: 38, scale: 5, null: false
  end

  add_index "combinaciones", ["CMB_COMPONENTECOD"], name: "CMB_COMPONENTECOD", using: :btree
  add_index "combinaciones", ["CMB_RESULTADOCOD"], name: "CMB_RESULTADOCOD", using: :btree

  create_table "comision", primary_key: "CMO_CODIGO", force: :cascade do |t|
    t.integer "TAR_CODIGO",     limit: 4
    t.string  "CMO_NOMBRE",     limit: 50
    t.decimal "CMO_PORCENTAJE",            precision: 38, scale: 4
    t.string  "CMO_TIPO",       limit: 50
  end

  create_table "complemento", primary_key: "CPL_CODIGO", force: :cascade do |t|
    t.string  "CPL_DESCRIPCION", limit: 50
    t.integer "CPL_ESTADO",      limit: 4
  end

  create_table "compras", primary_key: "COM_CODIGO", force: :cascade do |t|
    t.string   "COM_TIPODOC",         limit: 2,                                                  null: false
    t.string   "COM_NUMERO",          limit: 20,                                                 null: false
    t.string   "COM_AUTORIZACION",    limit: 50,                                                 null: false
    t.string   "COM_ESTABLECIMIENTO", limit: 3,                                                  null: false
    t.string   "COM_PTOEMISION",      limit: 3,                                                  null: false
    t.datetime "COM_FECHA"
    t.string   "COM_GUIA",            limit: 50,                                                 null: false
    t.decimal  "COM_SUBTOTAL12",                         precision: 38, scale: 4,                null: false
    t.decimal  "COM_SUBTOTAL0",                          precision: 38, scale: 4,                null: false
    t.decimal  "COM_SUBTOTALNOIVA",                      precision: 38, scale: 4, default: 0.0,  null: false
    t.decimal  "COM_DESCUENTO",                          precision: 38, scale: 4
    t.decimal  "COM_SUBTOTAL",                           precision: 38, scale: 4,                null: false
    t.decimal  "COM_IVA",                                precision: 38, scale: 4
    t.decimal  "COM_ICE",                                precision: 38, scale: 4, default: 0.0,  null: false
    t.decimal  "COM_TOTAL",                              precision: 38, scale: 4,                null: false
    t.integer  "COM_FPAGO",           limit: 4
    t.integer  "ASI_NUMERO",          limit: 4
    t.integer  "PRV_CODIGO",          limit: 4,                                                  null: false
    t.string   "SUS_CODIGO",          limit: 2
    t.integer  "USU_CODIGO",          limit: 4,                                                  null: false
    t.integer  "EMP_CODIGO",          limit: 4,                                                  null: false
    t.integer  "LOC_CODIGO",          limit: 4,                                                  null: false
    t.integer  "COM_TIPO",            limit: 4
    t.text     "COM_OBSERVACIONES",   limit: 4294967295
    t.integer  "COM_ENVIO",           limit: 4,                                   default: 0,    null: false
    t.integer  "COM_EMPAQUE",         limit: 4,                                   default: 0
    t.integer  "MCA_CODIGO",          limit: 4
    t.integer  "IMP_CODIGO",          limit: 4,                                   default: 0,    null: false
    t.integer  "COM_ESTADO",          limit: 4,                                                  null: false
    t.integer  "COM_COSTEONC",        limit: 4,                                   default: 0,    null: false
    t.decimal  "COM_SERVICIOS",                          precision: 38, scale: 2, default: 0.0,  null: false
    t.string   "FPS_CODIGO",          limit: 2,                                   default: "00", null: false
    t.datetime "COM_FECHAP",                                                                     null: false
  end

  add_index "compras", ["COM_TIPODOC", "COM_NUMERO", "COM_ESTABLECIMIENTO", "COM_PTOEMISION", "COM_AUTORIZACION", "PRV_CODIGO", "COM_ESTADO"], name: "IX_COMPRAS", unique: true, using: :btree
  add_index "compras", ["PRV_CODIGO"], name: "FK_COMPRAS_PROVEEDORES", using: :btree
  add_index "compras", ["SUS_CODIGO"], name: "SUS_CODIGO", using: :btree

  create_table "compras_detalle", primary_key: "COD_CODIGO", force: :cascade do |t|
    t.integer "COM_CODIGO",      limit: 4,                                           null: false
    t.integer "ITE_CODIGO",      limit: 4,                                           null: false
    t.string  "ITE_DESCRIPCION", limit: 250
    t.decimal "COD_CANTIDAD",                precision: 38, scale: 4,                null: false
    t.decimal "COD_DESCUENTO",               precision: 38, scale: 4
    t.decimal "COD_PUNITARIO",               precision: 38, scale: 4,                null: false
    t.decimal "COD_IMPUESTO",                precision: 38, scale: 4
    t.decimal "COD_VALOR",                   precision: 38, scale: 4,                null: false
    t.integer "LOC_CODIGO",      limit: 4,                            default: 0
    t.string  "SUS_CODIGO",      limit: 2,                            default: "00", null: false
  end

  add_index "compras_detalle", ["COM_CODIGO"], name: "FK_COMPRAS_DETALLE_COMPRAS", using: :btree
  add_index "compras_detalle", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree
  add_index "compras_detalle", ["SUS_CODIGO"], name: "SUS_CODIGO", using: :btree

  create_table "comprasin", primary_key: "CIN_CODIGO", force: :cascade do |t|
    t.integer  "PRV_CODIGO",        limit: 4
    t.decimal  "CIN_FLETE",                     precision: 38, scale: 4
    t.decimal  "CIN_TOTEXT",                    precision: 38, scale: 4
    t.decimal  "CIN_PESO",                      precision: 38, scale: 4
    t.decimal  "CIN_FS",                        precision: 38, scale: 4
    t.decimal  "CIN_SS",                        precision: 38, scale: 4
    t.decimal  "CIN_SED",                       precision: 38, scale: 4
    t.decimal  "CIN_HF",                        precision: 38, scale: 4
    t.decimal  "CIN_CAN",                       precision: 38, scale: 4
    t.decimal  "CIN_FAL",                       precision: 38, scale: 4
    t.decimal  "CIN_SEGURO",                    precision: 38, scale: 4
    t.decimal  "CIN_SALVAG",                    precision: 38, scale: 4
    t.decimal  "CIN_ARAD",                      precision: 38, scale: 4
    t.decimal  "CIN_FOFINFA",                   precision: 38, scale: 4
    t.decimal  "CIN_IVA",                       precision: 38, scale: 4
    t.decimal  "CIN_ICE",                       precision: 38, scale: 4
    t.decimal  "CIN_MULTAS",                    precision: 38, scale: 4
    t.decimal  "CIN_DF",                        precision: 38, scale: 4
    t.decimal  "CIN_LT",                        precision: 38, scale: 4
    t.decimal  "CIN_AS",                        precision: 38, scale: 4
    t.decimal  "CIN_AGAF",                      precision: 38, scale: 4
    t.decimal  "CIN_BA",                        precision: 38, scale: 4
    t.decimal  "CIN_VERIFICADORA",              precision: 38, scale: 4
    t.decimal  "CIN_FIC",                       precision: 38, scale: 4
    t.decimal  "CIN_AFLETE",                    precision: 38, scale: 4
    t.decimal  "CIN_GSEGURO",                   precision: 38, scale: 4
    t.decimal  "CIN_OTROS",                     precision: 38, scale: 4
    t.string   "CIN_OBSERVACIONES", limit: 150
    t.decimal  "CIN_IVA2",                      precision: 38, scale: 4
    t.decimal  "CIN_CF",                        precision: 38, scale: 4
    t.decimal  "CIN_TOTAL",                     precision: 38, scale: 4
    t.decimal  "CIN_DIVISAS",                   precision: 38, scale: 4
    t.string   "CIN_ESTADO",        limit: 50
    t.datetime "CIN_FECHA",                                              null: false
    t.string   "CIN_NUMERO",        limit: 50
    t.integer  "CIN_FPAGO",         limit: 4
    t.integer  "USU_CODIGO",        limit: 4
    t.integer  "EMP_CODIGO",        limit: 4
    t.integer  "LOC_CODIGO",        limit: 4
  end

  create_table "comprasin_detalle", primary_key: "CID_CODIGO", force: :cascade do |t|
    t.integer "CIN_CODIGO",      limit: 4
    t.integer "ITE_CODIGO",      limit: 4
    t.string  "ITE_DESCRIPCION", limit: 50
    t.decimal "CID_CANTIDAD",               precision: 38, scale: 4
    t.decimal "CID_PUNITARIO",              precision: 38, scale: 4
    t.decimal "CID_PUNIT",                  precision: 38, scale: 4
    t.decimal "CID_VALOR",                  precision: 38, scale: 4
    t.decimal "CID_VAL",                    precision: 38, scale: 4
    t.decimal "CID_PORCENTAJE",             precision: 38, scale: 4
    t.decimal "CID_MARKUP",                 precision: 38, scale: 4
    t.decimal "CID_TOTAL",                  precision: 38, scale: 4
  end

  create_table "comprobantes_anulados", primary_key: "CAN_CODIGO", force: :cascade do |t|
    t.integer  "AUT_CODIGO", limit: 4, null: false
    t.datetime "CAN_FECHA",            null: false
    t.string   "CAN_DESDE",  limit: 9, null: false
    t.string   "CAN_HASTA",  limit: 9, null: false
  end

  create_table "con_cabecera", primary_key: "CCA_CODIGO", force: :cascade do |t|
    t.datetime "CCA_FECHA",                                     null: false
    t.integer  "CBA_CODIGO", limit: 4,                          null: false
    t.integer  "CCA_ANIO",   limit: 4,                          null: false
    t.integer  "CCA_MES",    limit: 4,                          null: false
    t.integer  "USU_CODIGO", limit: 4,                          null: false
    t.decimal  "CCA_SALDOE",           precision: 38, scale: 2
  end

  add_index "con_cabecera", ["CBA_CODIGO", "CCA_ANIO", "CCA_MES"], name: "CONCILIACION", unique: true, using: :btree

  create_table "con_detalle", primary_key: "CDE_CODIGO", force: :cascade do |t|
    t.integer  "TRA_CODIGO",       limit: 4,             null: false
    t.integer  "CHE_CODIGO",       limit: 4, default: 0, null: false
    t.integer  "CDE_SELECCIONADO", limit: 4, default: 0, null: false
    t.integer  "CCA_CODIGO",       limit: 4,             null: false
    t.datetime "CDE_FECHA",                              null: false
  end

  add_index "con_detalle", ["CCA_CODIGO"], name: "CCA_CODIGO", using: :btree
  add_index "con_detalle", ["TRA_CODIGO"], name: "TRANSACCION", using: :btree

  create_table "con_informativo", primary_key: "CDI_CODIGO", force: :cascade do |t|
    t.string   "CDI_TIPO",        limit: 50
    t.string   "CDI_DESCRIPCION", limit: 250,                                        null: false
    t.decimal  "CDI_DEBE",                    precision: 38, scale: 2, default: 0.0, null: false
    t.decimal  "CDI_HABER",                   precision: 38, scale: 2, default: 0.0, null: false
    t.integer  "CCA_CODIGO",      limit: 4
    t.datetime "CDI_FECHA"
  end

  add_index "con_informativo", ["CCA_CODIGO"], name: "CCA_CODIGO", using: :btree
  add_index "con_informativo", ["CCA_CODIGO"], name: "FOREING_CONCILIACION", using: :btree

  create_table "concepto_retencion", primary_key: "CON_CODIGO", force: :cascade do |t|
    t.string   "CON_NUMERO",      limit: 10,                                       null: false
    t.string   "CON_CONCEPTO",    limit: 255,                                      null: false
    t.decimal  "CON_PORCENTAJE",              precision: 38, scale: 4
    t.integer  "CON_NUMANTERIOR", limit: 4
    t.datetime "CON_DESDE"
    t.datetime "CON_HASTA"
    t.integer  "CON_ESTADO",      limit: 4,                            default: 1, null: false
  end

  create_table "condicion", primary_key: "COA_CODIGO", force: :cascade do |t|
    t.string "COA_DENOMINACION", limit: 50
    t.string "COA_DESCRIPCION",  limit: 250
  end

  create_table "consumos", id: false, force: :cascade do |t|
    t.string  "CSM_MIN",       limit: 20,                             null: false
    t.string  "CSM_CONTRATO",  limit: 20,                             null: false
    t.string  "CSM_PLAN",      limit: 50,                             null: false
    t.string  "CSM_CODIGO",    limit: 20,                             null: false
    t.string  "CSM_VENDEDOR",  limit: 100,                            null: false
    t.decimal "CSM_VALOR",                   precision: 38, scale: 2, null: false
    t.text    "CSM_OBS",       limit: 65535,                          null: false
    t.decimal "CSM_ACUMULADO",               precision: 38, scale: 2, null: false
    t.decimal "CSM_ACTUAL",                  precision: 38, scale: 2, null: false
    t.integer "CSM_MES",       limit: 4,                              null: false
    t.integer "CSM_ANIO",      limit: 4,                              null: false
  end

  create_table "contratos", primary_key: "CON_CODIGO", force: :cascade do |t|
    t.integer  "USU_CODIGO",         limit: 4,                                null: false
    t.integer  "CON_TIPO",           limit: 4,                                null: false
    t.datetime "CON_FECHA",                                                   null: false
    t.datetime "CON_FINGRESO",                                                null: false
    t.datetime "CON_FSALIDA"
    t.string   "CON_ARCHIVO",        limit: 256
    t.text     "CON_OBSERVACIONESI", limit: 65535
    t.text     "CON_OBSERVACIONESS", limit: 65535
    t.integer  "CON_CALIFICADO",     limit: 4,                    default: 0, null: false
    t.integer  "CON_TPERSONAL",      limit: 4,                                null: false
    t.text     "CON_FUNCIONES",      limit: 65535
    t.text     "CON_CONTRATO",       limit: 65535
    t.decimal  "CON_HORASTP",                      precision: 10,             null: false
    t.integer  "CON_ESTADO",         limit: 4,                    default: 1, null: false
  end

  create_table "contratos_adhesion", primary_key: "CAD_CODIGO", force: :cascade do |t|
    t.string  "CAD_CONSTITUYENTE", limit: 500,   null: false
    t.text    "CAD_CONTRATO",      limit: 65535, null: false
    t.integer "CVV_CODIGO",        limit: 4,     null: false
  end

  create_table "contratos_detalle", primary_key: "CDE_CODIGO", force: :cascade do |t|
    t.integer  "CON_CODIGO",    limit: 4,                                      null: false
    t.decimal  "CDE_NOMINAL",             precision: 38, scale: 4,             null: false
    t.integer  "CDE_LIQUIDO",   limit: 4,                                      null: false
    t.integer  "JOR_CODIGO",    limit: 4
    t.integer  "HTR_CODIGO",    limit: 4,                                      null: false
    t.integer  "ORO_CODIGO",    limit: 4,                                      null: false
    t.integer  "CDE_CONFIANZA", limit: 4,                                      null: false
    t.integer  "CDE_FRESERVA",  limit: 4,                                      null: false
    t.integer  "CDE_PNOCTURNO", limit: 4,                                      null: false
    t.integer  "CDE_PSUPLE",    limit: 4,                                      null: false
    t.integer  "CDE_PEXTRA",    limit: 4,                                      null: false
    t.integer  "CDE_PDT",       limit: 4,                                      null: false
    t.integer  "CDE_PDC",       limit: 4,                                      null: false
    t.datetime "CDE_FECHA",                                                    null: false
    t.integer  "CDE_PIRENTA",   limit: 4
    t.integer  "CDE_ESTADO",    limit: 4,                          default: 1, null: false
    t.integer  "CDE_PAGARIESS", limit: 4,                          default: 0, null: false
    t.integer  "CDE_ADTERCERO", limit: 4,                          default: 1, null: false
    t.integer  "CDE_ADCUARTO",  limit: 4,                          default: 1, null: false
  end

  add_index "contratos_detalle", ["CON_CODIGO"], name: "CONTRATOS_CONDETALLE", using: :btree

  create_table "contratos_instalacion", primary_key: "CTR_CODIGO", force: :cascade do |t|
    t.datetime "CTR_FECHA",                                                             null: false
    t.datetime "CTR_FECHAINSTALACION",                                                  null: false
    t.string   "CTR_NROCONTRATO",      limit: 10
    t.string   "CTR_NUMERO",           limit: 20,                                       null: false
    t.integer  "CTR_SECUENCIAL",       limit: 4,                            default: 0, null: false
    t.integer  "CIU_CODIGO",           limit: 4,                            default: 0, null: false
    t.string   "CTR_OBSERVACIONES",    limit: 255
    t.string   "CTR_IDSESSION",        limit: 50
    t.string   "CTR_PASSWORD",         limit: 50
    t.decimal  "CTR_DESCUENTO",                    precision: 38, scale: 4
    t.integer  "CLI_CODIGO",           limit: 4
    t.integer  "ITE_SERVICIO",         limit: 4
    t.integer  "ITE_INSTALACION",      limit: 4
    t.integer  "VEN_CODIGO",           limit: 4
    t.integer  "TES_CODIGO",           limit: 4
    t.integer  "MOD_CODIGO",           limit: 4
    t.integer  "SOL_CODIGO",           limit: 4
  end

  add_index "contratos_instalacion", ["CLI_CODIGO"], name: "CLIENTES_CLI_CODIGOFK_idx", using: :btree
  add_index "contratos_instalacion", ["CTR_IDSESSION", "CTR_PASSWORD"], name: "CTR_IDSESSION_UNIQUE", unique: true, using: :btree
  add_index "contratos_instalacion", ["CTR_NUMERO"], name: "CTR_NUMERO_UNIQUE", unique: true, using: :btree
  add_index "contratos_instalacion", ["MOD_CODIGO"], name: "CONTRATOS_MOC_CODIGOFK", using: :btree
  add_index "contratos_instalacion", ["TES_CODIGO"], name: "TIPO_ESTADOS_TES_CODIGO_idx", using: :btree

  create_table "contratos_intermediacion", primary_key: "CIN_CODIGO", force: :cascade do |t|
    t.string   "CIN_NUMERO",    limit: 9,                              null: false
    t.integer  "VEH_CODIGO",    limit: 4,                              null: false
    t.datetime "CIN_FECHA",                                            null: false
    t.string   "CIN_COMPRADOR", limit: 500,                            null: false
    t.integer  "CIN_VENDEDOR",  limit: 4,                              null: false
    t.decimal  "VEH_VALOR",                   precision: 38, scale: 4, null: false
    t.integer  "CIN_FPAGO",     limit: 4,                              null: false
    t.integer  "CIN_ESTADO",    limit: 4,                              null: false
    t.integer  "COM_CODIGO",    limit: 4,                              null: false
    t.text     "CIN_CONTRATO",  limit: 65535,                          null: false
  end

  create_table "contratos_rdominio", primary_key: "CRD_CODIGO", force: :cascade do |t|
    t.text    "CRD_CONTRATO", limit: 65535, null: false
    t.integer "CVV_CODIGO",   limit: 4,     null: false
  end

  create_table "contratos_splash", primary_key: "CSP_CODIGO", force: :cascade do |t|
    t.integer  "CSP_REPRESENTANTE", limit: 4,                             null: false
    t.datetime "CSP_FECHA",                                               null: false
    t.decimal  "CSP_VALOR",                       precision: 8, scale: 4, null: false
    t.text     "CSP_BENEFICIOS",    limit: 65535,                         null: false
    t.text     "CSP_CONTRATO",      limit: 65535,                         null: false
    t.string   "CSP_OBSERVACIONES", limit: 250,                           null: false
    t.integer  "CSP_ESTADO",        limit: 4,                             null: false
  end

  create_table "contratos_ventaveh", primary_key: "CVV_CODIGO", force: :cascade do |t|
    t.integer  "CVV_NUMERO",        limit: 4,                            null: false
    t.integer  "VEH_CODIGO",        limit: 4,                            null: false
    t.datetime "CVV_FECHA",                                              null: false
    t.string   "CVV_VENDEDOR",      limit: 500,                          null: false
    t.decimal  "CVV_VALORVEH",                  precision: 38, scale: 4, null: false
    t.decimal  "CVV_VALORTOTALVEH",             precision: 38, scale: 4, null: false
    t.integer  "CVV_FPAGO",         limit: 4,                            null: false
    t.integer  "CVV_ESTADO",        limit: 4,                            null: false
    t.integer  "VEN_CODIGO",        limit: 4,                            null: false
  end

  create_table "cortegema", primary_key: "CTG_CODIGO", force: :cascade do |t|
    t.string  "CTG_DESCRIPCION", limit: 45
    t.integer "CTG_ESTADO",      limit: 4
  end

  create_table "cuadrecaja", primary_key: "CCA_CODIGO", force: :cascade do |t|
    t.datetime "CCA_FCIERRE",                       null: false
    t.integer  "PTO_CODIGO",  limit: 4,             null: false
    t.integer  "USU_CODIGO",  limit: 4,             null: false
    t.integer  "VEN_INICIAL", limit: 4,             null: false
    t.integer  "VEN_FINAL",   limit: 4,             null: false
    t.integer  "TCC_CODIGO",  limit: 4, default: 1, null: false
    t.integer  "LOC_CODIGO",  limit: 4, default: 0, null: false
  end

  add_index "cuadrecaja", ["TCC_CODIGO"], name: "FK_CUADRECAJA_TCC_CODIGO", using: :btree

  create_table "cuentas_bancos", primary_key: "CBA_CODIGO", force: :cascade do |t|
    t.integer  "CBA_TIPO",      limit: 4,                                       null: false
    t.string   "CBA_NUMERO",    limit: 50,                                      null: false
    t.integer  "BAN_CODIGO",    limit: 4,                                       null: false
    t.datetime "CBA_FCORTE",                                                    null: false
    t.integer  "CBA_PERTENECE", limit: 4,                           default: 1, null: false
    t.integer  "CBA_ASOCIADO",  limit: 4
    t.string   "CBA_NUMCHEQUE", limit: 50,                                      null: false
    t.decimal  "CBA_SALDO",                precision: 38, scale: 4,             null: false
    t.string   "CBA_OFICIAL",   limit: 50,                                      null: false
    t.integer  "PLA_CODIGO",    limit: 4
    t.integer  "CBA_ESTADO",    limit: 4,                                       null: false
  end

  create_table "cursos", id: false, force: :cascade do |t|
    t.integer "CUR_CODIGO",      limit: 4,          default: 0, null: false
    t.integer "USU_CODIGO",      limit: 4,                      null: false
    t.text    "CUR_DESCRIPCION", limit: 4294967295,             null: false
    t.integer "CUR_ESTADO",      limit: 4,          default: 1, null: false
  end

  create_table "danos", primary_key: "DAN_CODIGO", force: :cascade do |t|
    t.string  "DAN_NOMBRE", limit: 250, null: false
    t.integer "DAN_ESTADO", limit: 4,   null: false
  end

  create_table "decimos", primary_key: "DEC_CODIGO", force: :cascade do |t|
    t.datetime "DEC_FECHA",                                     null: false
    t.integer  "DEC_TIPO",   limit: 4,                          null: false
    t.integer  "DEC_FPAGO",  limit: 4
    t.decimal  "DEC_VALOR",            precision: 38, scale: 4, null: false
    t.integer  "USU_CODIGO", limit: 4,                          null: false
    t.datetime "DEC_FCOBRO"
    t.integer  "PER_CODIGO", limit: 4,                          null: false
  end

  create_table "dep_detalle", primary_key: "DED_CODIGO", force: :cascade do |t|
    t.integer  "DEP_CODIGO",  limit: 4
    t.datetime "DED_FECHA"
    t.integer  "DED_MESES",   limit: 4,                          null: false
    t.decimal  "DED_MENSUAL",           precision: 38, scale: 2
    t.integer  "ASI_NUMERO",  limit: 4
  end

  add_index "dep_detalle", ["DEP_CODIGO"], name: "IX_DEPRECIACIONES", using: :btree

  create_table "deppro", primary_key: "DPR_CODIGO", force: :cascade do |t|
    t.integer "CHE_CODIGO", limit: 4,  null: false
    t.string  "ASO_TIPO",   limit: 45, null: false
    t.integer "ASO_CODIGO", limit: 4,  null: false
  end

  create_table "depreciaciones", primary_key: "DEP_CODIGO", force: :cascade do |t|
    t.datetime "DEP_FECHA",                            null: false
    t.datetime "DEP_FOPERACION"
    t.integer  "MCA_CODIGO",     limit: 4
    t.integer  "ITE_CODIGO",     limit: 4
    t.integer  "DEP_ESTADO",     limit: 4, default: 1, null: false
  end

  add_index "depreciaciones", ["ITE_CODIGO"], name: "IX_ITEMS", using: :btree

  create_table "descuentos", primary_key: "DES_CODIGO", force: :cascade do |t|
    t.datetime "DES_FECHA",                                                            null: false
    t.datetime "DES_FDEBITO",                                                          null: false
    t.integer  "USU_CODIGO",        limit: 4,                                          null: false
    t.decimal  "DES_VALOR",                       precision: 38, scale: 2,             null: false
    t.integer  "PRV_CODIGO",        limit: 4,                                          null: false
    t.integer  "RPA_CODIGO",        limit: 4,                              default: 0, null: false
    t.text     "DES_OBSERVACIONES", limit: 65535
    t.integer  "TDE_CODIGO",        limit: 4,                              default: 4, null: false
    t.integer  "EGR_CODIGO",        limit: 4,                              default: 0, null: false
  end

  create_table "descuentos_locales", primary_key: "DEL_CODIGO", force: :cascade do |t|
    t.integer "CSP_CODIGO",     limit: 4, null: false
    t.integer "LOC_CODIGO",     limit: 4, null: false
    t.integer "DEL_PORCENTAJE", limit: 4, null: false
  end

  create_table "desempeno", primary_key: "DES_CODIGO", force: :cascade do |t|
    t.string  "DES_NOMBRE", limit: 250
    t.integer "DES_ESTADO", limit: 4,   default: 1
  end

  create_table "detalle_pedidos", primary_key: "DPE_CODIGO", force: :cascade do |t|
    t.decimal "DPE_CANTREFERENCIA",             precision: 38, scale: 4
    t.decimal "DPE_CANTPRODUCIDA",              precision: 38, scale: 4
    t.decimal "DPE_PESOBRUTO",                  precision: 38, scale: 4
    t.decimal "DPE_PESONETO",                   precision: 38, scale: 4
    t.decimal "DPE_NROBULTOS",                  precision: 38, scale: 4
    t.decimal "DPE_TIPOBULTO",                  precision: 38, scale: 4
    t.decimal "DPE_PRECIO",                     precision: 38, scale: 4
    t.decimal "DPE_DESCUENTO",                  precision: 8,  scale: 4, default: 0.0
    t.string  "DPE_NOTA",           limit: 100
    t.integer "PED_CODIGO",         limit: 4
    t.integer "ITE_CODIGO",         limit: 4
    t.integer "TPR_CODIGO",         limit: 4
    t.integer "CPL_CODIGO",         limit: 4
    t.integer "ESP_CODIGO",         limit: 4
    t.integer "VEN_CODIGO",         limit: 4
    t.integer "UNI_CODIGO",         limit: 4
  end

  add_index "detalle_pedidos", ["CPL_CODIGO"], name: "COMPLEMENTOFK", using: :btree
  add_index "detalle_pedidos", ["ESP_CODIGO"], name: "ESTADOPEDIDOFK", using: :btree
  add_index "detalle_pedidos", ["ITE_CODIGO"], name: "ITEMSFK", using: :btree
  add_index "detalle_pedidos", ["PED_CODIGO"], name: "DETALLEPEDIDOFK", using: :btree
  add_index "detalle_pedidos", ["TPR_CODIGO"], name: "TIPOPROCESAMIENTOFK", using: :btree
  add_index "detalle_pedidos", ["UNI_CODIGO"], name: "UNIDADPEDIDOSDET", using: :btree
  add_index "detalle_pedidos", ["VEN_CODIGO"], name: "VENTAPEDIDOSDET", using: :btree

  create_table "detalle_trans_avicolas", force: :cascade do |t|
    t.integer  "transformacion_avicola_id", limit: 4
    t.integer  "cantidad",                  limit: 4, null: false
    t.integer  "kit_id",                    limit: 4, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "detalle_trans_avicolas", ["kit_id"], name: "fk_rails_18a3a0ec44", using: :btree
  add_index "detalle_trans_avicolas", ["transformacion_avicola_id"], name: "index_detalle_trans_avicolas_on_transformacion_avicola_id", using: :btree

  create_table "ditemkitbases", force: :cascade do |t|
    t.decimal  "ancho",                             precision: 14, scale: 4
    t.decimal  "porcentaje_utilidad",               precision: 18, scale: 8, default: 0.0, null: false
    t.decimal  "largo",                             precision: 14, scale: 4
    t.decimal  "costo",                             precision: 18, scale: 8
    t.decimal  "cantidad",                          precision: 8,  scale: 2, default: 1.0, null: false
    t.text     "observacion",         limit: 65535
    t.integer  "kitbase_id",          limit: 4
    t.integer  "item_id",             limit: 4
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "asumir_sobrante",     limit: 1,                              default: 0
  end

  add_index "ditemkitbases", ["item_id"], name: "fk_rails_909c52d23b", using: :btree
  add_index "ditemkitbases", ["kitbase_id"], name: "fk_rails_9d1b0c3962", using: :btree

  create_table "dmanokitbases", force: :cascade do |t|
    t.decimal  "costo_hora",                        precision: 18, scale: 8
    t.integer  "tipo_hora",           limit: 4
    t.decimal  "porcentaje_utilidad",               precision: 18, scale: 8, default: 0.0, null: false
    t.text     "observacion",         limit: 65535
    t.integer  "kitbase_id",          limit: 4
    t.integer  "usuario_id",          limit: 4
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.decimal  "cantidad_de_horas",                 precision: 8,  scale: 2, default: 1.0, null: false
  end

  add_index "dmanokitbases", ["kitbase_id"], name: "fk_rails_0644853639", using: :btree

  create_table "documentos", primary_key: "DOC_CODIGO", force: :cascade do |t|
    t.string  "DOC_SIGLAS", limit: 4
    t.string  "DOC_NOMBRE", limit: 100
    t.integer "DOC_NUMERO", limit: 4
  end

  create_table "documentos_vehiculo", primary_key: "DVE_CODIGO", force: :cascade do |t|
    t.datetime "DVE_FECHA",                                       null: false
    t.string   "DVE_TIPO",   limit: 100,                          null: false
    t.integer  "DVE_ANIO",   limit: 4,                            null: false
    t.string   "DVE_MES",    limit: 15,                           null: false
    t.integer  "CIU_CODIGO", limit: 4,                            null: false
    t.integer  "VEH_CODIGO", limit: 4,                            null: false
    t.decimal  "DVE_VALOR",              precision: 38, scale: 4, null: false
    t.string   "DVE_ESTADO", limit: 20,                           null: false
  end

  create_table "egresos", primary_key: "EGR_CODIGO", force: :cascade do |t|
    t.integer  "EGR_NUMERO",   limit: 4,                            default: 0, null: false
    t.string   "EGR_TIPO",     limit: 50
    t.integer  "EGR_ASOCIADO", limit: 4
    t.string   "EGR_ACEPTADO", limit: 250
    t.decimal  "EGR_VALOR",                precision: 38, scale: 4
    t.datetime "EGR_FECHA"
    t.string   "EGR_CONCEPTO", limit: 250
    t.integer  "EGR_ESTADO",   limit: 4,                            default: 1
    t.integer  "PRV_CODIGO",   limit: 4,                            default: 0, null: false
  end

  add_index "egresos", ["PRV_CODIGO"], name: "PRV_CODIGO", using: :btree

  create_table "emails", primary_key: "EMA_CODIGO", force: :cascade do |t|
    t.integer  "CLI_CODIGO",    limit: 4,                                   null: false
    t.datetime "EMA_REGISTRO",                                              null: false
    t.datetime "EMA_FCORTE",                                                null: false
    t.string   "EMA_TIPO",      limit: 50,                                  null: false
    t.string   "EMA_MENSAJE",   limit: 170,                                 null: false
    t.string   "EMA_EMAIL",     limit: 500
    t.decimal  "EMA_VALOR",                        precision: 38, scale: 2, null: false
    t.text     "EMA_RESPUESTA", limit: 4294967295
    t.integer  "USU_CODIGO",    limit: 4
    t.integer  "ABV_CODIGO",    limit: 4,                                   null: false
  end

  add_index "emails", ["CLI_CODIGO"], name: "CLIENTEEMAILS", using: :btree

  create_table "empresas", id: false, force: :cascade do |t|
    t.integer "EMP_CODIGO",         limit: 4,                              default: 0,            null: false
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

  create_table "engastegema", primary_key: "ENG_CODIGO", force: :cascade do |t|
    t.string  "ENG_DESCRIPCION", limit: 45
    t.decimal "ENG_TAMANIO",                precision: 38, scale: 4
    t.integer "ENG_ESTADO",      limit: 4
  end

  create_table "entidades", primary_key: "ENT_CODIGO", force: :cascade do |t|
    t.string   "ENT_TIPOIDE",        limit: 2,               null: false
    t.string   "ENT_IDENTIFICACION", limit: 50,              null: false
    t.datetime "ENT_FREGISTRO"
    t.string   "ENT_NOMBRE",         limit: 250,             null: false
    t.string   "ENT_RCOMERCIAL",     limit: 250
    t.string   "ENT_DIRECCION",      limit: 250,             null: false
    t.string   "ENT_TELEFONO",       limit: 20,              null: false
    t.string   "ENT_FAX",            limit: 20
    t.string   "ENT_EMAIL",          limit: 250
    t.integer  "ENT_UBICACION",      limit: 4
    t.string   "ENT_OBSERVACIONES",  limit: 256
    t.string   "ENT_WEB",            limit: 250
    t.integer  "ENT_TIPOEMPRESA",    limit: 4
    t.integer  "ENT_ESPECIALIDAD",   limit: 4
    t.integer  "ENT_ESTADO",         limit: 4,   default: 1, null: false
  end

  add_index "entidades", ["ENT_IDENTIFICACION", "ENT_ESTADO"], name: "IX_ENTIDADES", unique: true, using: :btree
  add_index "entidades", ["ENT_TIPOIDE"], name: "FK_ENTIDADES_TIPO_IDENTIFICACION", using: :btree

  create_table "especialidad", primary_key: "ESP_CODIGO", force: :cascade do |t|
    t.string  "ESP_NOMBRE", limit: 50
    t.integer "ESP_ESTADO", limit: 4,  default: 1
  end

  create_table "estado_cheques", primary_key: "ESC_CODIGO", force: :cascade do |t|
    t.string "ESC_DESCRIPCION", limit: 200
  end

  create_table "estado_pedidos", primary_key: "ESP_CODIGO", force: :cascade do |t|
    t.string "ESP_DESCRIPCION", limit: 50
  end

  create_table "estados", primary_key: "EST_CODIGO", force: :cascade do |t|
    t.integer "EST_NUMERO",      limit: 4,  null: false
    t.string  "EST_DESCRIPCION", limit: 50, null: false
  end

  create_table "eventos", primary_key: "EVE_CODIGO", force: :cascade do |t|
    t.string  "EVE_DESCRIPCION", limit: 250, null: false
    t.integer "TEV_CODIGO",      limit: 4,   null: false
    t.integer "EVE_ESTADO",      limit: 4,   null: false
  end

  create_table "excepciones_calendario", primary_key: "ECA_CODIGO", force: :cascade do |t|
    t.string  "ECA_DESCRIPCION", limit: 50, null: false
    t.integer "ECA_ESTADO",      limit: 4,  null: false
  end

  create_table "fechascliente", id: false, force: :cascade do |t|
    t.datetime "VEN_FECHA"
    t.integer  "CLI_CODIGO", limit: 4
    t.string   "TIPO",       limit: 9, default: "", null: false
  end

  create_table "fechasproveedor", id: false, force: :cascade do |t|
    t.datetime "COM_FECHA"
    t.integer  "PRV_CODIGO", limit: 4
    t.string   "TIPO",       limit: 9, default: "", null: false
  end

  create_table "firmas", primary_key: "FIR_CODIGO", force: :cascade do |t|
    t.string  "FIR_DOCUMENTO", limit: 50, null: false
    t.integer "ROL_CODIGO",    limit: 4,  null: false
  end

  create_table "formagema", primary_key: "FRG_CODIGO", force: :cascade do |t|
    t.string  "FRG_DESCRIPCION", limit: 45
    t.integer "FRG_ESTADO",      limit: 4
  end

  create_table "formapagoabc", primary_key: "FPO_CODIGO", force: :cascade do |t|
    t.integer "EGR_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPO_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagoabc", ["EGR_CODIGO"], name: "EGRESOS_FPABC", using: :btree
  add_index "formapagoabc", ["EGR_CODIGO"], name: "FK_FORMAPAGOABC_EGRESOS", using: :btree

  create_table "formapagoabv", primary_key: "FPB_CODIGO", force: :cascade do |t|
    t.integer "ING_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPB_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagoabv", ["ING_CODIGO"], name: "FK_FORMAPAGOABV_INGRESOS", using: :btree

  create_table "formapagoanl", primary_key: "FPL_CODIGO", force: :cascade do |t|
    t.integer "ING_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPL_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagoanl", ["ING_CODIGO"], name: "FK_FORMAPAGOANL_INGRESOS", using: :btree

  create_table "formapagoanp", primary_key: "FPP_CODIGO", force: :cascade do |t|
    t.integer "EGR_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPP_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagoanp", ["EGR_CODIGO"], name: "FK_FORMAPAGOANP_EGRESOS", using: :btree

  create_table "formapagoant", primary_key: "FPN_CODIGO", force: :cascade do |t|
    t.integer "ANT_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPN_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagoant", ["ANT_CODIGO"], name: "FK_FORMAPAGOANT_ANTICIPOS", using: :btree

  create_table "formapagoc", primary_key: "FPC_CODIGO", force: :cascade do |t|
    t.integer "COM_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPC_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagoc", ["COM_CODIGO"], name: "FK_FORMAPAGOC_COMPRAS", using: :btree

  create_table "formapagodau", primary_key: "FPI_CODIGO", force: :cascade do |t|
    t.integer "IMP_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPI_VALOR",            precision: 38, scale: 4, null: false
  end

  create_table "formapagorol", primary_key: "FPR_CODIGO", force: :cascade do |t|
    t.integer "RPA_CODIGO", limit: 4,                          null: false
    t.integer "FPA_CODIGO", limit: 4,                          null: false
    t.decimal "FPR_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagorol", ["RPA_CODIGO"], name: "FK_FORMAPAGOROL_ROLPAGOS", using: :btree

  create_table "formapagov", primary_key: "FPV_CODIGO", force: :cascade do |t|
    t.integer "VEN_CODIGO", limit: 4,                          null: false
    t.integer "SUB_CODIGO", limit: 4,                          null: false
    t.decimal "FPV_VALOR",            precision: 38, scale: 4, null: false
  end

  add_index "formapagov", ["VEN_CODIGO"], name: "FK_FORMAPAGOV_VENTAS", using: :btree

  create_table "formaspago", primary_key: "FPA_CODIGO", force: :cascade do |t|
    t.string  "FPA_VALOR",  limit: 100
    t.integer "TIP_CODIGO", limit: 4
    t.string  "FPA_GRUPO",  limit: 50
    t.integer "FPA_ORDEN",  limit: 4
    t.integer "FPA_ESTADO", limit: 4,   default: 1
    t.string  "FPS_CODIGO", limit: 3,               null: false
    t.integer "FPA_CFINAL", limit: 4,               null: false
  end

  create_table "formaspagorel", id: false, force: :cascade do |t|
    t.integer "FPA_CODIGO", limit: 4, null: false
    t.string  "FPS_CODIGO", limit: 2, null: false
  end

  add_index "formaspagorel", ["FPS_CODIGO"], name: "FPS_CODIGO", using: :btree

  create_table "formaspagosri", primary_key: "FPS_CODIGO", force: :cascade do |t|
    t.string   "FPS_DESCRIPCION", limit: 250, null: false
    t.integer  "FPA_CODIGO",      limit: 4,   null: false
    t.integer  "FPS_ESTADO",      limit: 4,   null: false
    t.datetime "FPS_FINICIO",                 null: false
    t.datetime "FPS_FFIN"
  end

  create_table "garante_contrato", primary_key: "GCR_CODIGO", force: :cascade do |t|
    t.integer "CVV_CODIGO", limit: 4, null: false
    t.integer "CLI_CODIGO", limit: 4, null: false
  end

  create_table "garantes_contrato", primary_key: "GCR_CODIGO", force: :cascade do |t|
    t.integer "CVV_CODIGO", limit: 4, null: false
    t.integer "CLI_CODIGO", limit: 4, null: false
  end

  create_table "giftcard", primary_key: "GIF_CODIGO", force: :cascade do |t|
    t.integer  "CSP_CODIGO", limit: 4
    t.string   "GIF_NUMERO", limit: 45
    t.integer  "VEN_CODIGO", limit: 4
    t.decimal  "GIF_VALOR",             precision: 38, scale: 2
    t.integer  "GIF_TIPO",   limit: 4
    t.datetime "GIF_DESDE"
    t.datetime "GIF_HASTA"
    t.integer  "GIF_ESTADO", limit: 4,                           default: 1, null: false
  end

  add_index "giftcard", ["CSP_CODIGO"], name: "IX_COG_CODIGO", using: :btree
  add_index "giftcard", ["GIF_NUMERO"], name: "IX_GIF_NUMERO", unique: true, using: :btree
  add_index "giftcard", ["GIF_TIPO"], name: "IX_GIF_TIPO", using: :btree
  add_index "giftcard", ["VEN_CODIGO"], name: "IV_VEN_CODIGO", using: :btree

  create_table "grabado", primary_key: "GRB_CODIGO", force: :cascade do |t|
    t.string  "GRB_TEXTO",     limit: 45
    t.string  "GRB_TIPOLETRA", limit: 45
    t.integer "GRB_ESTADO",    limit: 4
  end

  create_table "gremision_detalle", primary_key: "GRD_CODIGO", force: :cascade do |t|
    t.integer "ITE_CODIGO",   limit: 4,                          null: false
    t.decimal "GRD_CANTIDAD",           precision: 38, scale: 4, null: false
    t.integer "GRE_CODIGO",   limit: 4,                          null: false
  end

  add_index "gremision_detalle", ["GRE_CODIGO"], name: "FK_GREMISION", using: :btree

  create_table "grupos", primary_key: "GRU_CODIGO", force: :cascade do |t|
    t.string  "GRU_DESCRIPCION", limit: 250
    t.integer "GRU_PERTENECE",   limit: 4
    t.integer "GRU_ESTADO",      limit: 4,   default: 1
  end

  create_table "guia_remisiones", primary_key: "GRE_CODIGO", force: :cascade do |t|
    t.integer  "VEN_CODIGO",          limit: 4,   null: false
    t.integer  "CLI_CODIGO",          limit: 4,   null: false
    t.integer  "PRV_CODIGO",          limit: 4,   null: false
    t.string   "GRE_NUMERO",          limit: 9,   null: false
    t.string   "GRE_AUTORIZACION",    limit: 50,  null: false
    t.string   "GRE_ESTABLECIMIENTO", limit: 3,   null: false
    t.string   "GRE_PTOEMISION",      limit: 3,   null: false
    t.datetime "GRE_FINICIO",                     null: false
    t.datetime "GRE_FTERMINACION",                null: false
    t.string   "GRE_OINGRESO",        limit: 45
    t.datetime "GRE_FEMISION",                    null: false
    t.string   "GRE_NDADUANERA",      limit: 45
    t.string   "GRE_MOTIVO",          limit: 500
    t.string   "GRE_PTOPARTIDA",      limit: 250
    t.string   "GRE_PTOLLEGADA",      limit: 250
    t.string   "GRE_PLACA",           limit: 45
    t.string   "GRE_OBSERVACIONES",   limit: 500
    t.string   "GRE_DDESPACHO",       limit: 45
    t.string   "GRE_CVENTA",          limit: 45
    t.integer  "PTO_CODIGO",          limit: 4,   null: false
    t.integer  "GRE_ESTADO",          limit: 4,   null: false
  end

  add_index "guia_remisiones", ["VEN_CODIGO"], name: "FK_VEN_CODIGO", using: :btree

  create_table "historial_contratos", primary_key: "HCO_CODIGO", force: :cascade do |t|
    t.datetime "HCO_FECHA"
    t.string   "HCO_OBSERVACIONES", limit: 200
    t.integer  "TES_CODIGO",        limit: 4
    t.integer  "CTR_CODIGO",        limit: 4
    t.integer  "CLI_CODIGO",        limit: 4
    t.integer  "ITE_PLAN",          limit: 4
  end

  add_index "historial_contratos", ["CTR_CODIGO"], name: "ESTADOS_CONTRATOS_CTR_CODIGO_idx", using: :btree

  create_table "historial_equipos", primary_key: "HIS_CODIGO", force: :cascade do |t|
    t.datetime "HIS_FECHA"
    t.string   "HIS_OBSERVACIONES", limit: 250
    t.integer  "HIS_ESTADO",        limit: 4
    t.integer  "ITE_CODIGO",        limit: 4
    t.integer  "CTR_CODIGO",        limit: 4
  end

  add_index "historial_equipos", ["CTR_CODIGO"], name: "HISTORIAL_CTR_CODIGOFK_idx", using: :btree

  create_table "hoja_ruta_tecnicos", primary_key: "HRT_CODIGO", force: :cascade do |t|
    t.string  "HRT_IDENTIFICADOR", limit: 50
    t.string  "HRT_NOMBRES",       limit: 50
    t.integer "VEH_CODIGO",        limit: 4
    t.integer "HRT_ESTADO",        limit: 4
  end

  create_table "hojaitems", force: :cascade do |t|
    t.decimal  "costo",                             precision: 40, scale: 20, default: 0.0,   null: false
    t.decimal  "cantidad",                          precision: 14, scale: 4,  default: 0.0,   null: false
    t.decimal  "ancho",                             precision: 14, scale: 4
    t.text     "observacion",         limit: 65535
    t.integer  "estado",              limit: 4,                               default: 0,     null: false
    t.boolean  "anulado",                                                     default: false, null: false
    t.boolean  "inicial",                                                     default: false, null: false
    t.boolean  "asumir_sobrante"
    t.integer  "item_id",             limit: 4
    t.integer  "ordenproducintel_id", limit: 4
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
  end

  add_index "hojaitems", ["item_id"], name: "fk_rails_d1a37a1d26", using: :btree
  add_index "hojaitems", ["ordenproducintel_id"], name: "fk_rails_170c2819d0", using: :btree

  create_table "hojamanoobras", force: :cascade do |t|
    t.decimal  "cantidad_de_horas",                 precision: 8,  scale: 2, default: 1.0,   null: false
    t.decimal  "costo",                             precision: 18, scale: 8, default: 0.0,   null: false
    t.integer  "tipo_hora",           limit: 4,                              default: 0,     null: false
    t.text     "observacion",         limit: 65535
    t.integer  "estado",              limit: 4,                              default: 0,     null: false
    t.boolean  "anulado",                                                    default: false, null: false
    t.boolean  "inicial",                                                    default: false, null: false
    t.integer  "usuario_id",          limit: 4,                                              null: false
    t.integer  "ordenproducintel_id", limit: 4
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
  end

  add_index "hojamanoobras", ["ordenproducintel_id"], name: "fk_rails_ecdaeaf555", using: :btree

  create_table "horarios", primary_key: "HOR_CODIGO", force: :cascade do |t|
    t.integer "HOR_DIA",      limit: 4, null: false
    t.time    "HOR_HENTRADA",           null: false
    t.time    "HOR_HSALIDA",            null: false
    t.integer "HTR_CODIGO",   limit: 4, null: false
  end

  create_table "htrabajo", primary_key: "HTR_CODIGO", force: :cascade do |t|
    t.string  "HTR_DESCRIPCION", limit: 45, null: false
    t.integer "HTR_ESTADO",      limit: 4,  null: false
  end

  create_table "importaciones", primary_key: "IMP_CODIGO", force: :cascade do |t|
    t.string   "IMP_DOCUMENTO", limit: 250,                                      null: false
    t.datetime "IMP_FECHA",                                                      null: false
    t.decimal  "IMP_TOTAL",                 precision: 38, scale: 4,             null: false
    t.integer  "PRV_CODIGO",    limit: 4,                                        null: false
    t.integer  "USU_CODIGO",    limit: 4,                                        null: false
    t.integer  "LOC_CODIGO",    limit: 4
    t.integer  "IMP_FPAGO",     limit: 4,                                        null: false
    t.integer  "COM_CODIGO",    limit: 4,                            default: 0
    t.integer  "IMP_ESTADO",    limit: 4,                                        null: false
    t.integer  "IMP_KARDEX",    limit: 4,                            default: 0, null: false
  end

  add_index "importaciones", ["COM_CODIGO"], name: "COM_CODIGO", using: :btree

  create_table "importaciones_detalle", primary_key: "IMD_CODIGO", force: :cascade do |t|
    t.integer "IMP_CODIGO",         limit: 4,                                             null: false
    t.integer "ITE_CODIGO",         limit: 4,                                             null: false
    t.string  "ITE_DESCRIPCION",    limit: 250,                                           null: false
    t.decimal "IMD_CANTIDAD",                   precision: 38, scale: 4,                  null: false
    t.decimal "IMD_PUNITARIO",                  precision: 38, scale: 4,                  null: false
    t.decimal "IMD_VALOR",                      precision: 38, scale: 4,                  null: false
    t.decimal "IMD_COSTOT",                     precision: 38, scale: 4, default: 0.0,    null: false
    t.decimal "IMD_VALORT",                     precision: 38, scale: 4, default: 0.0,    null: false
    t.decimal "IMD_PVP",                        precision: 38, scale: 4, default: 0.0,    null: false
    t.decimal "IMD_PVD",                        precision: 38, scale: 4, default: 0.0,    null: false
    t.integer "PAI_CODIGO",         limit: 4,                            default: 0,      null: false
    t.decimal "IMD_PESO",                       precision: 38, scale: 4, default: 0.0,    null: false
    t.string  "PAR_CODIGO",         limit: 20
    t.string  "IMD_COMPLEMENTARIO", limit: 4,                            default: "0000", null: false
    t.string  "IMD_SUPLEMENTARIO",  limit: 4,                            default: "0000", null: false
    t.decimal "IMD_FOB",                        precision: 38, scale: 2, default: 0.0,    null: false
    t.integer "IMD_NROITEM",        limit: 4,                                             null: false
  end

  add_index "importaciones_detalle", ["IMP_CODIGO"], name: "IMP_CODIGO", using: :btree
  add_index "importaciones_detalle", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree

  create_table "importacionesa", primary_key: "IAD_CODIGO", force: :cascade do |t|
    t.integer  "IMP_CODIGO",        limit: 4,                                          null: false
    t.integer  "AGE_CODIGO",        limit: 4,                                          null: false
    t.string   "IAD_DOCUMENTO",     limit: 250,                                        null: false
    t.string   "IAD_ORDEN",         limit: 250,                                        null: false
    t.string   "IAD_ANIO",          limit: 250,                                        null: false
    t.integer  "ADU_CODIGO",        limit: 4,                                          null: false
    t.integer  "REG_CODIGO",        limit: 4,                                          null: false
    t.date     "IAD_FECHATX",                                                          null: false
    t.string   "IAD_HORATX",        limit: 5,                                          null: false
    t.integer  "PRV_CODIGO",        limit: 4,                                          null: false
    t.string   "IAD_RNUMERO",       limit: 250,                                        null: false
    t.date     "IAD_FECHAA",                                                           null: false
    t.string   "IAD_HORAA",         limit: 5,                                          null: false
    t.decimal  "IAD_FOB",                       precision: 38, scale: 4,               null: false
    t.decimal  "IAD_FLETE",                     precision: 38, scale: 4,               null: false
    t.decimal  "IAD_SEGURO",                    precision: 38, scale: 4,               null: false
    t.decimal  "IAD_AJUSTE",                    precision: 38, scale: 4,               null: false
    t.decimal  "IAD_CIF",                       precision: 38, scale: 4,               null: false
    t.decimal  "IAD_ADUANA",                    precision: 38, scale: 4,               null: false
    t.decimal  "IAD_TOTAL",                     precision: 38, scale: 4
    t.float    "IAD_IVA",           limit: 53,                           default: 0.0, null: false
    t.integer  "IAD_FPAGO",         limit: 4,                                          null: false
    t.integer  "IAD_ESTADO",        limit: 4
    t.integer  "COM_CODIGO",        limit: 4,                                          null: false
    t.string   "IAD_AFORO",         limit: 100,                                        null: false
    t.string   "IAD_OBSERVACIONES", limit: 500,                                        null: false
    t.integer  "IAD_PRORRATEO",     limit: 4,                            default: 1,   null: false
    t.decimal  "IAD_MULTA",                     precision: 38, scale: 2, default: 0.0, null: false
    t.decimal  "IAD_ISD",                       precision: 38, scale: 2, default: 0.0, null: false
    t.decimal  "IAD_GASTOS",                    precision: 38, scale: 2, default: 0.0, null: false
    t.decimal  "IAD_INTERESES",                 precision: 38, scale: 2, default: 0.0, null: false
    t.decimal  "IAD_OTROS",                     precision: 38, scale: 2, default: 0.0, null: false
    t.datetime "IAD_FKARDEX"
    t.integer  "MCA_CODIGO",        limit: 4,                            default: 0,   null: false
  end

  add_index "importacionesa", ["COM_CODIGO"], name: "COM_CODIGO", using: :btree

  create_table "importacionesa_detalle", primary_key: "IDE_CODIGO", force: :cascade do |t|
    t.integer "IAD_CODIGO",      limit: 4,   null: false
    t.string  "IDE_CONCEPTO",    limit: 250, null: false
    t.string  "IDE_LIQUIDACION", limit: 50,  null: false
    t.string  "IDE_LIBERACION",  limit: 50,  null: false
    t.string  "IDE_CANTIDAD",    limit: 50,  null: false
  end

  create_table "importdau_detalle", primary_key: "IDD_CODIGO", force: :cascade do |t|
    t.integer "IAD_CODIGO",        limit: 4,                                        null: false
    t.integer "IDD_NROITEM",       limit: 4,                                        null: false
    t.decimal "IDD_ADVALOREM",               precision: 38, scale: 2,               null: false
    t.decimal "IDD_ESPECIFICO",              precision: 38, scale: 2,               null: false
    t.decimal "IDD_ANTIDUMPING",             precision: 38, scale: 2,               null: false
    t.decimal "IDD_FONDINFA",                precision: 38, scale: 2,               null: false
    t.decimal "IDD_ICEADVALOREM",            precision: 38, scale: 2,               null: false
    t.decimal "IDD_ICEESPECIFICO",           precision: 38, scale: 2,               null: false
    t.decimal "IDD_IVA",                     precision: 38, scale: 2,               null: false
    t.decimal "IDD_SALVAGUARDIA",            precision: 38, scale: 2,               null: false
    t.decimal "IDD_SALVAGUARDIAE",           precision: 38, scale: 2,               null: false
    t.decimal "IDD_ISD",                     precision: 38, scale: 2, default: 0.0, null: false
  end

  add_index "importdau_detalle", ["IAD_CODIGO", "IDD_NROITEM"], name: "IAD_CODIGO", using: :btree
  add_index "importdau_detalle", ["IDD_NROITEM"], name: "ITE_CODIGO", using: :btree

  create_table "impresiones", primary_key: "IMP_CODIGO", force: :cascade do |t|
    t.string  "TIC_CODIGO",  limit: 50
    t.string  "IMP_ARCHIVO", limit: 100
    t.integer "IMP_LIMITE",  limit: 4,   null: false
  end

  create_table "impresoras", primary_key: "IPR_CODIGO", force: :cascade do |t|
    t.string "IPR_NOMBRE", limit: 20, null: false
    t.string "IPR_TIPO",   limit: 10, null: false
    t.string "IPR_IP",     limit: 50
  end

  create_table "impuestos", primary_key: "IMP_CODIGO", force: :cascade do |t|
    t.string   "IMP_NOMBRE",      limit: 100
    t.string   "IMP_DESCRIPCION", limit: 200
    t.decimal  "IMP_VALOR",                   precision: 38, scale: 4
    t.datetime "IMP_VIGENCIA",                                                                null: false
    t.datetime "IMP_HASTA"
    t.integer  "IMP_ESTADO",      limit: 4
    t.string   "IMP_TIPO",        limit: 10,                                                  null: false
    t.string   "IMP_TIPOVALOR",   limit: 10,                           default: "PORCENTAJE", null: false
    t.decimal  "IMP_ADVALOREM",               precision: 38, scale: 2,                        null: false
    t.decimal  "IMP_EXFABRICA",               precision: 38, scale: 2,                        null: false
    t.decimal  "IMP_EXADUANA",                precision: 38, scale: 2,                        null: false
    t.integer  "IMP_EXHIBIR",     limit: 4,                            default: 1,            null: false
  end

  create_table "ingresos", primary_key: "ING_CODIGO", force: :cascade do |t|
    t.integer  "ING_NUMERO",   limit: 4,                            default: 0,       null: false
    t.string   "ING_TIPO",     limit: 50,                           default: "VENTA"
    t.integer  "ING_ASOCIADO", limit: 4
    t.string   "ING_RECIBIDO", limit: 250
    t.decimal  "ING_VALOR",                precision: 38, scale: 4
    t.datetime "ING_FECHA"
    t.string   "ING_CONCEPTO", limit: 250
    t.integer  "PTO_CODIGO",   limit: 4,                            default: 0,       null: false
    t.integer  "VDR_CODIGO",   limit: 4,                            default: 0,       null: false
    t.integer  "ING_ESTADO",   limit: 4,                            default: 1
  end

  add_index "ingresos", ["ING_ASOCIADO"], name: "IX_INGRESOS", using: :btree
  add_index "ingresos", ["VDR_CODIGO"], name: "VDR_CODIGO", using: :btree

  create_table "item_aplicaciones", primary_key: "IAP_CODIGO", force: :cascade do |t|
    t.integer "ITE_CODIGO", limit: 4
    t.integer "APL_CODIGO", limit: 4
  end

  create_table "item_proveedor", primary_key: "IPR_CODIGO", force: :cascade do |t|
    t.integer "IPR_ITEM",      limit: 4, null: false
    t.integer "IPR_PROVEEDOR", limit: 4, null: false
  end

  create_table "item_relacion", primary_key: "REL_CODIGO", force: :cascade do |t|
    t.integer "REL_ITEMP", limit: 4
    t.integer "REL_ITEMS", limit: 4
  end

  add_index "item_relacion", ["REL_ITEMP", "REL_ITEMS"], name: "IX_UNICO", unique: true, using: :btree
  add_index "item_relacion", ["REL_ITEMS"], name: "REL_ITEMS", using: :btree

  create_table "itemcarac", id: false, force: :cascade do |t|
    t.integer "ITE_CODIGO", limit: 4,   null: false
    t.integer "CAR_CODIGO", limit: 4,   null: false
    t.string  "ITC_VALOR",  limit: 250, null: false
  end

  add_index "itemcarac", ["CAR_CODIGO"], name: "CAR_FOREIGN", using: :btree
  add_index "itemcarac", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree

  create_table "itemprecios", id: false, force: :cascade do |t|
    t.integer "TCL_CODIGO", limit: 4,                          null: false
    t.integer "ITE_CODIGO", limit: 4,                          null: false
    t.integer "LOC_CODIGO", limit: 4,                          null: false
    t.decimal "ITP_PRECIO",           precision: 38, scale: 4
  end

  add_index "itemprecios", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree

  create_table "items", primary_key: "ITE_CODIGO", force: :cascade do |t|
    t.string   "ITE_CODIGOUSU",      limit: 50
    t.string   "ITE_BARRAS",         limit: 50
    t.text     "ITE_DESCRIPCION",    limit: 65535
    t.text     "ITE_GENERICO",       limit: 65535
    t.datetime "ITE_FECHA"
    t.integer  "ITE_TIPO",           limit: 4
    t.integer  "ITE_LINEA",          limit: 4
    t.integer  "ITE_MARCA",          limit: 4
    t.integer  "ITE_GRUPO",          limit: 4
    t.integer  "ITE_TSURTIDO",       limit: 4
    t.string   "ITE_LOCALIZACION",   limit: 50
    t.integer  "ITE_UNIDADC",        limit: 4
    t.integer  "ITE_UNIDADV",        limit: 4
    t.decimal  "ITE_FACTOR",                            precision: 38, scale: 4
    t.decimal  "ITE_UNIDADE",                           precision: 38, scale: 4
    t.integer  "ITE_NUMSERIE",       limit: 4
    t.integer  "ITE_LOTES",          limit: 4
    t.integer  "ITE_PADUANALES",     limit: 4
    t.decimal  "ITE_GANANCIAPVD",                       precision: 38, scale: 4
    t.decimal  "ITE_PVD",                               precision: 38, scale: 4
    t.decimal  "ITE_GANANCIAPVP",                       precision: 38, scale: 4
    t.decimal  "ITE_PVP",                               precision: 38, scale: 4
    t.decimal  "ITE_PVO",                               precision: 38, scale: 4
    t.decimal  "ITE_STOCKMAX",                          precision: 38, scale: 4
    t.decimal  "ITE_STOCKMIN",                          precision: 38, scale: 4, default: 0.0
    t.integer  "ITE_COSTEO",         limit: 4
    t.decimal  "ITE_IMPUESTO",                          precision: 38, scale: 4
    t.text     "ITE_OBSERVACIONES",  limit: 4294967295
    t.integer  "ITE_MODELO",         limit: 4
    t.string   "ITE_IMAGEN",         limit: 250
    t.decimal  "ITE_TEORICO",                           precision: 38, scale: 4
    t.datetime "ITE_MODIFICADO",                                                                null: false
    t.string   "ITE_IGENERAL",       limit: 250
    t.string   "ITE_ESPECIFICACION", limit: 250
    t.integer  "ITE_MOBILE",         limit: 4,                                                  null: false
    t.integer  "ITE_ENVIO",          limit: 4,                                                  null: false
    t.integer  "ITE_EMPAQUE",        limit: 4,                                   default: 0
    t.string   "CON_CODIGO",         limit: 10,                                  default: "0",  null: false
    t.integer  "ITE_CONJUNTO",       limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_TARJETA",        limit: 4,                                   default: 0
    t.string   "ITE_TCLASE",         limit: 45
    t.integer  "SIC_CODIGO",         limit: 4,                                                  null: false
    t.integer  "COA_CODIGO",         limit: 4,                                                  null: false
    t.integer  "TDE_CODIGO",         limit: 4,                                                  null: false
    t.integer  "ITE_METODODEP",      limit: 4,                                   default: 0
    t.decimal  "ITE_VALRESIDUAL",                       precision: 38, scale: 2, default: 0.0
    t.string   "SUS_CODIGO",         limit: 2,                                   default: "00", null: false
    t.integer  "ITE_PROCEDENCIA",    limit: 4,                                   default: 0,    null: false
    t.string   "PAR_CODIGO",         limit: 20,                                                 null: false
    t.integer  "ITE_PLANTILLA",      limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_VIRTUAL",        limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_INDIVIDUAL",     limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_PEDIDOS",        limit: 4,                                   default: 0,    null: false
    t.decimal  "ITE_PESO",                              precision: 38, scale: 2,                null: false
    t.decimal  "ITE_LARGO",                             precision: 38, scale: 2,                null: false
    t.decimal  "ITE_ANCHO",                             precision: 38, scale: 2,                null: false
    t.decimal  "ITE_ALTO",                              precision: 38, scale: 2,                null: false
    t.text     "ITE_NOTA",           limit: 65535,                                              null: false
    t.string   "ITE_TAGS",           limit: 500,                                                null: false
    t.integer  "ITE_FREE",           limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_PESADO",         limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_ESTADO",         limit: 4,                                   default: 1
    t.integer  "LOC_PROYECTO",       limit: 4,                                   default: -1,   null: false
    t.integer  "ITE_ICE",            limit: 4,                                   default: -1,   null: false
    t.integer  "ITE_GALCOHOLICO",    limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_CAPACIDAD",      limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_CODIMPICE",      limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_CODCLAICE",      limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_CODMARICE",      limit: 4,                                   default: 0,    null: false
    t.string   "ITE_ESTADOICE",      limit: 1,                                   default: "",   null: false
    t.integer  "ITE_CODPREICE",      limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_UNIDADICE",      limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_PAISORIGEN",     limit: 4,                                   default: 593,  null: false
    t.integer  "ITE_CODGALCOHOLICO", limit: 4,                                   default: 0,    null: false
    t.integer  "ITE_RECETA",         limit: 4,                                   default: 0,    null: false
    t.decimal  "ITE_CMUANCHO",                          precision: 18, scale: 8
    t.decimal  "ITE_CMULARGO",                          precision: 18, scale: 8
  end

  add_index "items", ["COA_CODIGO"], name: "COA_CODIGO", using: :btree
  add_index "items", ["ITE_BARRAS"], name: "IX_ITEMS", using: :btree
  add_index "items", ["ITE_CODIGOUSU"], name: "IX_ITEMS_1", unique: true, using: :btree
  add_index "items", ["ITE_GRUPO"], name: "IX_GRUPOS", using: :btree
  add_index "items", ["ITE_LINEA"], name: "FK_ITEMS_LINEAS", using: :btree
  add_index "items", ["ITE_MARCA"], name: "FK_ITEMS_MARCAS", using: :btree
  add_index "items", ["ITE_UNIDADC"], name: "IX_UNIDADCOMPRA", using: :btree
  add_index "items", ["ITE_UNIDADV"], name: "IX_UNIDADVENTA", using: :btree
  add_index "items", ["PAR_CODIGO"], name: "PAR_CODIGO", using: :btree
  add_index "items", ["SIC_CODIGO"], name: "SIC_CODIGO", using: :btree
  add_index "items", ["SUS_CODIGO"], name: "SUS_CODIGO", using: :btree
  add_index "items", ["TDE_CODIGO"], name: "TDE_CODIGO", using: :btree

  create_table "itemseries", id: false, force: :cascade do |t|
    t.integer "ITE_CODIGO",   limit: 4,  null: false
    t.string  "ITS_SERIE",    limit: 50, null: false
    t.string  "ITS_MIN",      limit: 50, null: false
    t.string  "ITS_TIPO",     limit: 50, null: false
    t.integer "ITS_ASOCIADO", limit: 4,  null: false
  end

  create_table "iva", id: false, force: :cascade do |t|
    t.integer  "IVA_CODIGO",      limit: 4,                            default: 0, null: false
    t.string   "IVA_NOMBRE",      limit: 100
    t.string   "IVA_DESCRIPCION", limit: 200
    t.decimal  "IVA_VALOR",                   precision: 38, scale: 4
    t.datetime "IVA_DESDE"
    t.datetime "IVA_HASTA"
    t.integer  "IVA_ESTADO",      limit: 4
    t.integer  "IVA_SRI",         limit: 4,                            default: 0, null: false
    t.integer  "IVA_TIPO",        limit: 4,                                        null: false
  end

  create_table "jornada", id: false, force: :cascade do |t|
    t.integer "JOR_CODIGO",     limit: 4,   default: 0, null: false
    t.string  "JOR_NOMBRE",     limit: 100
    t.integer "JOR_LABORABLES", limit: 4
    t.integer "JOR_DESCANSO",   limit: 4
    t.integer "JOR_ESTADO",     limit: 4,   default: 1, null: false
  end

  create_table "joya", primary_key: "JOY_CODIGO", force: :cascade do |t|
    t.string  "JOY_NOMBRE",       limit: 45
    t.string  "JOY_PESO",         limit: 45
    t.string  "JOY_CALIDAD",      limit: 45
    t.string  "JOY_ANCHO",        limit: 45
    t.string  "JOY_TALLA",        limit: 45
    t.string  "JOY_COLECCION",    limit: 45
    t.string  "JOY_ESPESOR",      limit: 45
    t.decimal "JOY_LONGITUD",                precision: 38, scale: 4
    t.string  "JOY_SEGURO",       limit: 45
    t.integer "JOY_ITEM",         limit: 4,                           null: false
    t.string  "JOY_REPLICAMETAL", limit: 45
    t.string  "JOY_ORDEN",        limit: 45
  end

  add_index "joya", ["JOY_ITEM"], name: "FK_JOYA_ITEMS1_IDX", using: :btree

  create_table "joymatprima", primary_key: "JMP_CODIGO", force: :cascade do |t|
    t.integer "JMP_JOYACODIGO",   limit: 4
    t.integer "JMP_SERVICIO",     limit: 4
    t.integer "JMP_GRABADO",      limit: 4
    t.integer "JMP_ENGASTE",      limit: 4
    t.integer "JMP_ITEM",         limit: 4
    t.integer "JMP_FORMAGEMA",    limit: 4
    t.integer "JMP_POSICIONGEMA", limit: 4
    t.integer "JMP_CORTEGEMA",    limit: 4
    t.string  "JMP_CANTIDADGEMA", limit: 45
    t.string  "JMP_TAMANIOGEMA",  limit: 45
    t.string  "JMP_PUREZAGEMA",   limit: 45
    t.string  "JMP_COLOR",        limit: 45
    t.string  "JMP_BANDA",        limit: 45
    t.integer "JMP_ESTADO",       limit: 4
  end

  add_index "joymatprima", ["JMP_CORTEGEMA"], name: "FK_JOYMATPRIMA_CORTEGEMA1_IDX", using: :btree
  add_index "joymatprima", ["JMP_ENGASTE"], name: "FK_JOYAMATERIAPRIMA_ENGASTE1_IDX", using: :btree
  add_index "joymatprima", ["JMP_FORMAGEMA"], name: "FK_JOYMATPRIMA_FORMAGEMA1_IDX", using: :btree
  add_index "joymatprima", ["JMP_GRABADO"], name: "FK_JOYAMATERIAPRIMA_GRABADO1_IDX", using: :btree
  add_index "joymatprima", ["JMP_ITEM"], name: "FK_JOYMATPRIMA_ITEMS1_IDX", using: :btree
  add_index "joymatprima", ["JMP_JOYACODIGO"], name: "FK_JOYAMATERIA_IDX", using: :btree
  add_index "joymatprima", ["JMP_POSICIONGEMA"], name: "FK_JOYMATPRIMA_POSICIONGEMA1_IDX", using: :btree
  add_index "joymatprima", ["JMP_SERVICIO"], name: "FK_JOYAMATERIAPRIMA_SERVICIO1_IDX", using: :btree

  create_table "kardex", primary_key: "KDX_CODIGO", force: :cascade do |t|
    t.integer  "KDX_TIPO",        limit: 4
    t.integer  "MOV_CODIGO",      limit: 4
    t.integer  "KDX_DOCUMENTO",   limit: 4
    t.string   "KDX_GENERADO",    limit: 45
    t.datetime "KDX_REGISTRO",                                         null: false
    t.integer  "ITE_CODIGO",      limit: 4
    t.integer  "LOT_CODIGO",      limit: 4
    t.integer  "KDX_LOCAL",       limit: 4
    t.string   "KDX_DESCRIPCION", limit: 100
    t.decimal  "KDX_CANTIDAD",                precision: 38, scale: 4
    t.decimal  "KDX_PUNITARIO",               precision: 38, scale: 4
    t.decimal  "KDX_SALDO",                   precision: 38, scale: 4
    t.decimal  "KDX_COSTO",                   precision: 38, scale: 4
  end

  add_index "kardex", ["ITE_CODIGO"], name: "FK_KARDEX_ITEMS", using: :btree
  add_index "kardex", ["LOT_CODIGO"], name: "LOT_CODIGO", using: :btree

  create_table "kitbases", force: :cascade do |t|
    t.decimal  "medida_ancho",                           precision: 18, scale: 8
    t.decimal  "medida_alto",                            precision: 18, scale: 8
    t.decimal  "medida_largo",                           precision: 18, scale: 8
    t.decimal  "maximo_ancho",                           precision: 18, scale: 8
    t.decimal  "maximo_alto",                            precision: 18, scale: 8
    t.decimal  "maximo_largo",                           precision: 18, scale: 8
    t.decimal  "porcentaje_utilidad",                    precision: 18, scale: 8,  default: 0.0
    t.decimal  "valor_metro",                            precision: 18, scale: 8
    t.boolean  "utilidad_global"
    t.text     "descripcion",              limit: 65535
    t.decimal  "coeficiente_de_variacion",               precision: 20, scale: 10, default: 1.0, null: false
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
  end

  add_index "kitbases", ["descripcion"], name: "descripcion", type: :fulltext
  add_index "kitbases", ["descripcion"], name: "descripcion_2", type: :fulltext

  create_table "kits", primary_key: "KIT_CODIGO", force: :cascade do |t|
    t.integer "KIT_ITEM",     limit: 4,                                        null: false
    t.integer "KIT_PARTES",   limit: 4,                                        null: false
    t.decimal "KIT_CANTIDAD",           precision: 38, scale: 4,               null: false
    t.string  "KIT_SUMA",     limit: 1,                          default: "S", null: false
  end

  create_table "lineas", primary_key: "LIN_CODIGO", force: :cascade do |t|
    t.string  "LIN_PARTICULAR",  limit: 50,              null: false
    t.string  "LIN_DESCRIPCION", limit: 250,             null: false
    t.integer "LIN_ESTADO",      limit: 4,   default: 1, null: false
  end

  add_index "lineas", ["LIN_PARTICULAR"], name: "IX_LINEAS", unique: true, using: :btree

  create_table "liquidaciones", primary_key: "LIQ_CODIGO", force: :cascade do |t|
    t.integer  "UES_CODIGO",       limit: 4,                                      null: false
    t.datetime "LIQ_FECHA",                                                       null: false
    t.decimal  "LIQ_NOMINAL",                precision: 38, scale: 4,             null: false
    t.decimal  "LIQ_BASICO",                 precision: 38, scale: 4,             null: false
    t.decimal  "LIQ_BONIFICACION",           precision: 38, scale: 4,             null: false
    t.decimal  "LIQ_VACACIONES",             precision: 38, scale: 4,             null: false
    t.integer  "LIQ_ANIOS",        limit: 4,                                      null: false
    t.decimal  "LIQ_D3",                     precision: 38, scale: 4,             null: false
    t.decimal  "LIQ_D4",                     precision: 38, scale: 4,             null: false
    t.decimal  "LIQ_SUBTOTAL",               precision: 38, scale: 4,             null: false
    t.decimal  "LIQ_DESAHUCIO",              precision: 38, scale: 4,             null: false
    t.decimal  "LIQ_TOTAL",                  precision: 38, scale: 4,             null: false
    t.integer  "MLI_CODIGO",       limit: 4,                                      null: false
    t.decimal  "LIQ_EXTRA",                  precision: 38, scale: 4,             null: false
    t.integer  "LIQ_ESTADO",       limit: 4,                          default: 1
  end

  create_table "llamadas", primary_key: "LLA_CODIGO", force: :cascade do |t|
    t.integer  "CLI_CODIGO",    limit: 4,                                   null: false
    t.datetime "LLA_REGISTRO",                                              null: false
    t.datetime "LLA_FCORTE",                                                null: false
    t.string   "LLA_CONTACTO",  limit: 200
    t.string   "LLA_TCELULAR",  limit: 20
    t.decimal  "LLA_VALOR",                        precision: 38, scale: 2, null: false
    t.text     "LLA_NOVEDADES", limit: 4294967295
    t.integer  "USU_CODIGO",    limit: 4
    t.integer  "ABV_CODIGO",    limit: 4,                                   null: false
  end

  add_index "llamadas", ["CLI_CODIGO"], name: "CLIENTELLAMADA", using: :btree

  create_table "localempresa", id: false, force: :cascade do |t|
    t.integer "LEM_CODIGO", limit: 4, default: 0, null: false
    t.integer "LOC_CODIGO", limit: 4,             null: false
    t.integer "EMP_CODIGO", limit: 4,             null: false
  end

  create_table "locales", id: false, force: :cascade do |t|
    t.integer "LOC_CODIGO",    limit: 4,   default: 0, null: false
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

  create_table "lotes", primary_key: "LOT_CODIGO", force: :cascade do |t|
    t.integer  "ITE_CODIGO",    limit: 4,                            null: false
    t.string   "LOT_NUMERO",    limit: 200
    t.string   "LOT_BARRAS",    limit: 200,                          null: false
    t.datetime "LOT_FECHA"
    t.decimal  "LOT_CANTIDAD",              precision: 38, scale: 4, null: false
    t.datetime "LOT_CADUCIDAD",                                      null: false
    t.string   "LOT_UBICADO",   limit: 200
  end

  add_index "lotes", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree
  add_index "lotes", ["LOT_BARRAS"], name: "LOT_BARRAS", using: :btree

  create_table "lotesmov", id: false, force: :cascade do |t|
    t.integer "LOT_CODIGO",   limit: 4,                           null: false
    t.string  "LMO_TIPO",     limit: 50,                          null: false
    t.integer "LMO_ASOCIADO", limit: 4,                           null: false
    t.decimal "LMO_CANTIDAD",            precision: 38, scale: 4, null: false
  end

  add_index "lotesmov", ["LMO_ASOCIADO"], name: "LMO_ASOCIADO", using: :btree
  add_index "lotesmov", ["LOT_CODIGO"], name: "LOT_CODIGO", using: :btree

  create_table "mantenimientoveh", primary_key: "MAN_CODIGO", force: :cascade do |t|
    t.integer "VEH_CODIGO",         limit: 4,     null: false
    t.integer "COM_CODIGO",         limit: 4,     null: false
    t.string  "MAN_TIPO",           limit: 100,   null: false
    t.text    "MAN_ZONAREPARACION", limit: 65535, null: false
    t.integer "RES_CODIGO",         limit: 4,     null: false
    t.integer "DVE_CODIGO",         limit: 4,     null: false
  end

  create_table "marcas", primary_key: "MAR_CODIGO", force: :cascade do |t|
    t.string  "MAR_NOMBRE", limit: 100, null: false
    t.integer "MAR_ESTADO", limit: 4,   null: false
  end

  create_table "mastercard", primary_key: "MAS_CODIGO", force: :cascade do |t|
    t.string   "MAS_DESCRIPCION", limit: 45
    t.datetime "MAS_REGISTRO"
  end

  create_table "menu", primary_key: "MEN_CODIGO", force: :cascade do |t|
    t.string  "MEN_NOMBRE",   limit: 50,              null: false
    t.string  "MEN_PROGRAMA", limit: 200
    t.integer "MEN_PCODIGO",  limit: 4,               null: false
    t.integer "MEN_ORDEN",    limit: 4,               null: false
    t.integer "MEN_MOVILES",  limit: 4,   default: 1, null: false
    t.string  "MEN_ICON",     limit: 45
    t.string  "MEN_PATH",     limit: 255
  end

  create_table "menu_botones", primary_key: "MEB_CODIGO", force: :cascade do |t|
    t.integer "MEN_CODIGO", limit: 4, null: false
    t.integer "BOT_CODIGO", limit: 4, null: false
  end

  add_index "menu_botones", ["MEN_CODIGO", "BOT_CODIGO"], name: "IX_MEN_ACCION", unique: true, using: :btree

  create_table "merma", primary_key: "MCB_CODIGO", force: :cascade do |t|
    t.string   "MCB_NOMBREJOY",     limit: 100
    t.string   "MCB_NUMERO",        limit: 45,  null: false
    t.datetime "MCB_FECHAINICIO"
    t.datetime "MCB_FECHAFIN"
    t.string   "MCB_OBSERVACIONES", limit: 45
    t.integer  "MCB_ESTADO",        limit: 4,   null: false
    t.integer  "ORD_CODIGO",        limit: 4,   null: false
  end

  add_index "merma", ["ORD_CODIGO"], name: "FK_MERMA_CABECERA_ORDENES1_IDX", using: :btree

  create_table "merma_detalle", primary_key: "MDT_CODIGO", force: :cascade do |t|
    t.integer "MDT_ITEM",             limit: 4,  null: false
    t.string  "MDT_DESCRIPCION",      limit: 45
    t.float   "MDT_MATERIAENTREGADO", limit: 53
    t.float   "MDT_MATERIADEVUELTO",  limit: 53
    t.float   "MDT_FUN",              limit: 53
    t.float   "MDT_PREPUL",           limit: 53
    t.float   "MDT_SALDO",            limit: 53
    t.float   "MDT_CAJON",            limit: 53
    t.integer "MDT_MERMA",            limit: 4,  null: false
    t.integer "MDT_ESTADO",           limit: 4
  end

  add_index "merma_detalle", ["MDT_MERMA"], name: "FK_MERMA_DETALLE_MERMA_CABECERA1_IDX", using: :btree

  create_table "mesas", primary_key: "MES_CODIGO", force: :cascade do |t|
    t.integer "MES_NUMERO",      limit: 4,                          null: false
    t.integer "MES_NCOMENSALES", limit: 4,                          null: false
    t.decimal "MES_POSX",                   precision: 8, scale: 4, null: false
    t.decimal "MES_POSY",                   precision: 8, scale: 4, null: false
    t.string  "MES_TIPO",        limit: 50,                         null: false
    t.string  "MES_DISPONIBLE",  limit: 50,                         null: false
    t.integer "SAL_CODIGO",      limit: 4,                          null: false
    t.integer "MES_ESTADO",      limit: 4,                          null: false
  end

  create_table "meses", primary_key: "MES_CODIGO", force: :cascade do |t|
    t.string "MES_VALOR", limit: 50, null: false
  end

  create_table "modelo_contratos", primary_key: "MOD_CODIGO", force: :cascade do |t|
    t.string  "MOD_NOMBRE",    limit: 50
    t.text    "MOD_CLAUSULAS", limit: 4294967295
    t.integer "MOD_ESTADO",    limit: 4
  end

  create_table "motivosliq", primary_key: "MLI_CODIGO", force: :cascade do |t|
    t.string  "MLI_DESCRIPCION", limit: 150,             null: false
    t.integer "MLI_ESTADO",      limit: 4,   default: 1, null: false
  end

  create_table "mov_cabecera", primary_key: "MCA_CODIGO", force: :cascade do |t|
    t.integer  "MCA_MOVIMIENTO",    limit: 4,                 null: false
    t.datetime "MCA_FECHA",                                   null: false
    t.string   "MCA_DOCUMENTO",     limit: 200,               null: false
    t.string   "MCA_TIPO",          limit: 45
    t.integer  "MCA_PROCLI",        limit: 4,                 null: false
    t.integer  "LOC_CODIGO",        limit: 4,                 null: false
    t.integer  "MCA_IMPRESO",       limit: 4,     default: 0, null: false
    t.text     "MCA_OBSERVACIONES", limit: 65535
    t.integer  "MCA_ESTADO",        limit: 4,     default: 1, null: false
  end

  add_index "mov_cabecera", ["MCA_MOVIMIENTO"], name: "MCA_MOVIMIENTO", using: :btree

  create_table "mov_detalle", primary_key: "MDE_CODIGO", force: :cascade do |t|
    t.integer "MCA_CODIGO",     limit: 4,                                        null: false
    t.integer "ITE_CODIGO",     limit: 4,                                        null: false
    t.decimal "MDE_CANTIDAD",             precision: 38, scale: 4,               null: false
    t.decimal "MDE_PRECIO",               precision: 38, scale: 4,               null: false
    t.decimal "MDE_OCOSTOS",              precision: 38, scale: 5, default: 0.0, null: false
    t.decimal "MDE_OCOSTOSIVA",           precision: 38, scale: 5, default: 0.0, null: false
    t.decimal "MDE_VALOR",                precision: 38, scale: 4,               null: false
  end

  add_index "mov_detalle", ["ITE_CODIGO"], name: "ITE_CODIGO", using: :btree
  add_index "mov_detalle", ["MCA_CODIGO"], name: "FK_MOV_DETALLE_MOV_CABECERA", using: :btree
  add_index "mov_detalle", ["MCA_CODIGO"], name: "IX_CABECERA", using: :btree

  create_table "movimientos", primary_key: "MOV_CODIGO", force: :cascade do |t|
    t.integer "MOV_TIPO",        limit: 4,               null: false
    t.string  "MOV_DESCRIPCION", limit: 200,             null: false
    t.integer "MOV_CUENTA",      limit: 4
    t.integer "MOV_ASOCIADO",    limit: 4,               null: false
    t.integer "MOV_ASIENTO",     limit: 4,   default: 0, null: false
  end

  create_table "nivelestudio", id: false, force: :cascade do |t|
    t.integer "NIV_CODIGO",      limit: 4,  default: 0, null: false
    t.string  "NIV_DESCRIPCION", limit: 22,             null: false
    t.integer "NIV_ESTADO",      limit: 4,  default: 1, null: false
  end

  create_table "nodos", primary_key: "NOD_CODIGO", force: :cascade do |t|
    t.string  "NOD_IPPUBLICA",     limit: 100
    t.string  "NOD_IP",            limit: 100
    t.string  "NOD_DESCRIPCION",   limit: 50
    t.string  "NOD_USUARIO",       limit: 50
    t.string  "NOD_CLAVE",         limit: 50
    t.string  "NOD_OBSERVACIONES", limit: 100
    t.integer "NOD_ESTADO",        limit: 4
    t.integer "CIU_CODIGO",        limit: 4
  end

  add_index "nodos", ["NOD_IPPUBLICA"], name: "NOD_CODREFERENCIAL_UNIQUE", unique: true, using: :btree

  create_table "operadorast", id: false, force: :cascade do |t|
    t.integer "OPE_CODIGO",      limit: 4,  default: 0, null: false
    t.string  "OPE_DESCRIPCION", limit: 11,             null: false
    t.integer "OPE_ESTADO",      limit: 4,              null: false
  end

  create_table "ordenes", primary_key: "ORD_CODIGO", force: :cascade do |t|
    t.integer  "VEN_CODIGO",        limit: 4
    t.integer  "ORD_ANIO",          limit: 4
    t.string   "ORD_NUMERO",        limit: 7
    t.datetime "ORD_REGISTRO"
    t.datetime "ORD_FECHA",                                        null: false
    t.integer  "VEH_CODIGO",        limit: 4
    t.integer  "VEH_KILOMETRAJE",   limit: 4
    t.integer  "CLI_CODIGO",        limit: 4
    t.integer  "USU_CODIGO",        limit: 4
    t.integer  "ORD_CONO",          limit: 4
    t.string   "ORD_TRABAJO",       limit: 50
    t.string   "ORD_RECEPCION",     limit: 50
    t.text     "ORD_OBSERVACIONES", limit: 4294967295
    t.text     "ORD_PROFORMA",      limit: 4294967295
    t.integer  "ORD_ESTADO",        limit: 4,          default: 1
    t.string   "ORD_TIPO",          limit: 45
    t.string   "ORD_DESCRIPCION",   limit: 45
    t.integer  "VDR_CODIGO",        limit: 4,                      null: false
    t.datetime "ORD_FECHAENTREGA"
    t.string   "ORD_TERMINADO",     limit: 45
    t.string   "ORD_SEGUIMIENTO",   limit: 45
    t.string   "ORD_ATENCION",      limit: 250,                    null: false
  end

  add_index "ordenes", ["ORD_TIPO", "ORD_NUMERO", "ORD_ANIO"], name: "ORD_TIPO", unique: true, using: :btree

  create_table "ordenes_detalle", primary_key: "ODE_CODIGO", force: :cascade do |t|
    t.integer "ORD_CODIGO",      limit: 4
    t.integer "USU_CODIGO",      limit: 4
    t.integer "VEN_CODIGO",      limit: 4
    t.integer "ITE_CODIGO",      limit: 4
    t.string  "ITE_DESCRIPCION", limit: 250
    t.decimal "ODE_CANTIDAD",                precision: 38, scale: 4
    t.decimal "ODE_DESCUENTO",               precision: 38, scale: 4
    t.decimal "ODE_PRECIO",                  precision: 38, scale: 4
    t.decimal "ODE_IMPUESTO",                precision: 38, scale: 4
    t.decimal "ODE_VALOR",                   precision: 38, scale: 4
    t.decimal "ODE_MEDIDA",                  precision: 38, scale: 6, null: false
  end

  add_index "ordenes_detalle", ["ORD_CODIGO"], name: "FK_ORDENES_DETALLE_ORDENES", using: :btree

  create_table "ordenes_trabajo", primary_key: "ORT_CODIGO", force: :cascade do |t|
    t.integer  "MOV_CODIGO",               limit: 4
    t.string   "ORT_NUMERO",               limit: 45
    t.datetime "ORT_FECHAINGRESO"
    t.string   "ORT_MAC",                  limit: 100
    t.string   "ORT_IPESTATICA",           limit: 100
    t.string   "ORT_IPPRIVADA",            limit: 100
    t.string   "ORT_IPPUBLICA",            limit: 100
    t.string   "ORT_RESULTADO",            limit: 45
    t.string   "ORT_OBSERVACIONESCLIENTE", limit: 100
    t.string   "ORT_OBSERVACIONES",        limit: 100
    t.datetime "ORT_FECHAINSTALACION"
    t.string   "ORT_HORAINSTALACION",      limit: 10
    t.integer  "ORT_CONDICION",            limit: 4
    t.string   "ORT_S",                    limit: 50
    t.string   "ORT_HSNM",                 limit: 50
    t.string   "ORT_H_BASEANTENA",         limit: 50
    t.string   "ORT_O",                    limit: 50
    t.string   "ORT_HEDIFICIO",            limit: 50
    t.integer  "ORT_ESTADO",               limit: 4
    t.string   "ORT_MESFACTURACION",       limit: 50
    t.string   "ORT_ANIOFACTURACION",      limit: 50
    t.string   "ORT_ANTENA",               limit: 100
    t.integer  "TSE_CODIGO",               limit: 4
    t.integer  "USU_TECNICO",              limit: 4
    t.integer  "CLI_ENCARGADO",            limit: 4
    t.integer  "CTR_CODIGO",               limit: 4
    t.integer  "SOL_CODIGO",               limit: 4
    t.integer  "ANT_CODIGO",               limit: 4
  end

  add_index "ordenes_trabajo", ["ANT_CODIGO"], name: "ANTENAS_ANT_CODIGO_idx", using: :btree
  add_index "ordenes_trabajo", ["CTR_CODIGO"], name: "contrato_sol_codigofk_idx", using: :btree
  add_index "ordenes_trabajo", ["ORT_NUMERO"], name: "ORT_NUMERO_UNIQUE", unique: true, using: :btree
  add_index "ordenes_trabajo", ["SOL_CODIGO"], name: "SOLICITUDES_SOL_CODIGOFK_idx", using: :btree

  create_table "ordenprocesos", primary_key: "PRP_CODIGO", force: :cascade do |t|
    t.string   "PRP_OPERACION",     limit: 45
    t.string   "PRP_TIEMPO",        limit: 5
    t.decimal  "PRP_TEMPERATURA",              precision: 38, scale: 2
    t.datetime "PRP_FECHAENTRADA"
    t.datetime "PRP_FECHASALIDA"
    t.integer  "PRP_RESPONSABLE",   limit: 4
    t.string   "PRP_OBSERVACIONES", limit: 60
    t.integer  "ORP_CODIGO",        limit: 4
    t.datetime "PRP_FECHAREGISTRO",                                     null: false
  end

  add_index "ordenprocesos", ["ORP_CODIGO"], name: "PRP_ORDENPRODUCCIONFK_IDX", using: :btree

  create_table "ordenprocesosemp", primary_key: "PEM_CODIGO", force: :cascade do |t|
    t.datetime "PEM_FECHAREGISTRO"
    t.datetime "PEM_FECHAENTRADA"
    t.datetime "PEM_FECHASALIDA"
    t.string   "PEM_TEMPERATURA",   limit: 45
    t.string   "PEM_OBSERVACIONES", limit: 200
    t.decimal  "PEM_CANTIDAD",                  precision: 38, scale: 2, null: false
    t.integer  "ITE_CODIGO",        limit: 4,                            null: false
    t.integer  "ORP_CODIGO",        limit: 4,                            null: false
    t.integer  "USU_CODIGO",        limit: 4,                            null: false
    t.integer  "MCA_CODIGO",        limit: 4
    t.datetime "PEM_FECHABOD"
    t.integer  "LOC_CODIGO",        limit: 4
    t.integer  "USU_CODIGOB",       limit: 4
  end

  add_index "ordenprocesosemp", ["ITE_CODIGO"], name: "PRODEXT_ITE_CODIGOFK_IDX", using: :btree
  add_index "ordenprocesosemp", ["ORP_CODIGO"], name: "PRODEXT_ORP_CODIGOFK_IDX", using: :btree

  create_table "ordenprodins", primary_key: "OPI_CODIGO", force: :cascade do |t|
    t.integer  "PEM_CODIGO",        limit: 4,                              null: false
    t.integer  "ITE_CODIGO",        limit: 4,                              null: false
    t.datetime "OPI_FECHA",                                                null: false
    t.decimal  "OPI_CANTIDAD",                    precision: 38, scale: 4, null: false
    t.text     "OPI_OBSERVACIONES", limit: 65535,                          null: false
    t.string   "OPI_BODEGAGE",      limit: 250,                            null: false
    t.integer  "LOC_CODIGO",        limit: 4
  end

  add_index "ordenprodins", ["ITE_CODIGO"], name: "PRODINS_ITE_CODIGOFK_IDX", using: :btree
  add_index "ordenprodins", ["PEM_CODIGO"], name: "PRODEMP_PEM_CODIGOFK_IDX", using: :btree

  create_table "ordenprodpan", primary_key: "ORP_CODIGO", force: :cascade do |t|
    t.datetime "ORP_FECHA"
    t.decimal  "ORP_PESOMATERIAL",             precision: 8,  scale: 4
    t.string   "ORP_NUMERO",        limit: 10
    t.string   "ORP_LOTE",          limit: 50
    t.integer  "ORP_TOTALUNIDADES", limit: 4
    t.decimal  "ORP_TOTALPESO",                precision: 8,  scale: 4
    t.datetime "ORP_FECHAPESADO"
    t.decimal  "ORP_PESOUNIDAD",               precision: 8,  scale: 4
    t.integer  "ITE_CODIGO",        limit: 4,                           null: false
    t.integer  "CLI_CODIGO",        limit: 4
    t.integer  "USU_CODIGO",        limit: 4
    t.decimal  "ORP_ELABORADA",                precision: 38, scale: 2
    t.decimal  "ORP_DEFECTUOSA",               precision: 38, scale: 2
    t.integer  "LOC_CODIGO",        limit: 4
    t.integer  "TRF_CODIGO",        limit: 4
  end

  add_index "ordenprodpan", ["CLI_CODIGO"], name: "ORP_CLI_CODIGOFK_IDX", using: :btree
  add_index "ordenprodpan", ["ITE_CODIGO"], name: "ORP_ITE_CODIGOFK_IDX", using: :btree

  create_table "ordenprodpandet", primary_key: "OPD_CODIGO", force: :cascade do |t|
    t.decimal "OPD_CANTIDAD",                 precision: 8, scale: 4
    t.string  "OPD_REVISION",      limit: 45
    t.string  "OPD_OBSERVACIONES", limit: 45
    t.integer "ITE_CODIGO",        limit: 4
    t.integer "ORP_CODIGO",        limit: 4
  end

  add_index "ordenprodpandet", ["ITE_CODIGO"], name: "DEP_ITE_CODIGOFK_IDX", using: :btree
  add_index "ordenprodpandet", ["ORP_CODIGO"], name: "DEP_ORP_CODIGOFK_IDX", using: :btree

  create_table "ordenproducintels", force: :cascade do |t|
    t.decimal  "cantidad",                          precision: 10, scale: 4, default: 0.0, null: false
    t.text     "descripcion",         limit: 65535
    t.integer  "estado",              limit: 4,                              default: 0,   null: false
    t.datetime "fecha_inicio"
    t.datetime "fecha_final"
    t.datetime "fecha_entrega"
    t.datetime "fecha_terminacion"
    t.integer  "cliente_id",          limit: 4
    t.integer  "profinteldetalle_id", limit: 4
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "ordenproducintels", ["cliente_id"], name: "fk_rails_dc4f22256a", using: :btree
  add_index "ordenproducintels", ["profinteldetalle_id"], name: "fk_rails_927bf14e63", using: :btree

  create_table "ordfiles", primary_key: "OAR_CODIGO", force: :cascade do |t|
    t.integer "ORD_CODIGO", limit: 4,   null: false
    t.string  "OAR_PATH",   limit: 250, null: false
  end

  create_table "org_rol", primary_key: "ORO_CODIGO", force: :cascade do |t|
    t.integer "ORG_CODIGO", limit: 4,             null: false
    t.integer "ROL_CODIGO", limit: 4,             null: false
    t.integer "ORO_ESTADO", limit: 4, default: 1, null: false
  end

  add_index "org_rol", ["ORG_CODIGO", "ROL_CODIGO"], name: "IX_ORG_ROL", unique: true, using: :btree
  add_index "org_rol", ["ROL_CODIGO"], name: "FK_ORG_ROL_ROLES", using: :btree

  create_table "org_rol_usu", primary_key: "ORU_CODIGO", force: :cascade do |t|
    t.integer "ORO_CODIGO", limit: 4, null: false
    t.integer "USU_CODIGO", limit: 4, null: false
  end

  add_index "org_rol_usu", ["ORO_CODIGO"], name: "FK_ORG_ROL_USU_ORG_ROL", using: :btree

  create_table "organico", primary_key: "ORG_CODIGO", force: :cascade do |t|
    t.string  "ORG_DESCRIPCION", limit: 255
    t.integer "ORG_PADRE",       limit: 4
    t.integer "ORG_TIPO",        limit: 4
    t.string  "ORG_SIGLAS",      limit: 10
    t.integer "ORG_ESTADO",      limit: 4,   default: 1
  end

  create_table "ort_detalle", primary_key: "OTD_CODIGO", force: :cascade do |t|
    t.decimal "OTD_CANTIDAD",                precision: 8,  scale: 4
    t.string  "ITE_DESCRIPCION", limit: 250
    t.decimal "OTD_PRECIO",                  precision: 38, scale: 4
    t.decimal "OTD_IMPUESTO",                precision: 38, scale: 4
    t.decimal "OTD_VALOR",                   precision: 38, scale: 4
    t.decimal "OTD_DESCUENTO",               precision: 38, scale: 4
    t.integer "OTD_ESTADO",      limit: 4
    t.integer "OTD_FACTURADO",   limit: 4
    t.integer "ITE_CODIGO",      limit: 4,                            null: false
    t.integer "VEN_CODIGO",      limit: 4
    t.integer "ORT_CODIGO",      limit: 4
  end

  add_index "ort_detalle", ["ITE_CODIGO"], name: "fk_ORT_DETALLE_ite_codigo_idx", using: :btree
  add_index "ort_detalle", ["ORT_CODIGO"], name: "fk_ORT_DETALLE_ordenes_trabajo1_idx", using: :btree

  create_table "packevento", primary_key: "PAE_CODIGO", force: :cascade do |t|
    t.integer "PAE_OPCION", limit: 4, null: false
    t.integer "ITE_CODIGO", limit: 4, null: false
    t.integer "RES_CODIGO", limit: 4, null: false
  end

  create_table "paduanales", primary_key: "PAD_CODIGO", force: :cascade do |t|
    t.integer  "KDX_CODIGO",    limit: 4
    t.decimal  "PAD_CANTIDAD",              precision: 38, scale: 4
    t.datetime "PAD_REGISTRO"
    t.string   "PAD_PEDIMENTO", limit: 200
    t.datetime "PAD_INGRESO",                                        null: false
    t.integer  "PAD_ADUANA",    limit: 4
    t.integer  "PAD_ESTADO",    limit: 4
  end

  add_index "paduanales", ["KDX_CODIGO"], name: "FK_PADUANALES_KARDEX", using: :btree
  add_index "paduanales", ["PAD_ADUANA"], name: "FK_PADUANALES_ADUANAS", using: :btree

  create_table "pagos_compras", primary_key: "PCO_CODIGO", force: :cascade do |t|
    t.integer  "FPC_CODIGO",      limit: 4,                                        null: false
    t.decimal  "PCO_CUOTA",                  precision: 38, scale: 4,              null: false
    t.datetime "PCO_VENCIMIENTO",                                                  null: false
    t.decimal  "PCO_INTERES",                precision: 38, scale: 4
    t.decimal  "PCO_SALDO",                  precision: 38, scale: 4,              null: false
    t.string   "PCO_LETRA",       limit: 50,                                       null: false
    t.integer  "PCO_ESTADO",      limit: 4,                           default: 96, null: false
  end

  add_index "pagos_compras", ["FPC_CODIGO"], name: "FK_PAGOS_COMPRAS_FORMAPAGOC", using: :btree

  create_table "pagos_ventas", primary_key: "PVE_CODIGO", force: :cascade do |t|
    t.integer  "FPV_CODIGO",      limit: 4,                                        null: false
    t.decimal  "PVE_CUOTA",                  precision: 38, scale: 4,              null: false
    t.datetime "PVE_VENCIMIENTO",                                                  null: false
    t.decimal  "PVE_INTERES",                precision: 38, scale: 4
    t.decimal  "PVE_SALDO",                  precision: 38, scale: 4,              null: false
    t.string   "PVE_LETRA",       limit: 50,                                       null: false
    t.integer  "PVE_ESTADO",      limit: 4,                           default: 96, null: false
    t.decimal  "PVE_SALDOCAP",               precision: 38, scale: 2,              null: false
  end

  add_index "pagos_ventas", ["FPV_CODIGO"], name: "FK_PAGOS_VENTAS_FORMAPAGOV", using: :btree

  create_table "pagosanticipocom", primary_key: "PAC_CODIGO", force: :cascade do |t|
    t.integer "FPC_CODIGO", limit: 4
    t.decimal "PAC_VALOR",            precision: 38, scale: 2
    t.integer "ANT_CODIGO", limit: 4
  end

  add_index "pagosanticipocom", ["ANT_CODIGO"], name: "IX_ANTCOM", using: :btree
  add_index "pagosanticipocom", ["ANT_CODIGO"], name: "IX_ANTCOM_idx", using: :btree
  add_index "pagosanticipocom", ["FPC_CODIGO"], name: "IX_FORMASCOM_idx", using: :btree
  add_index "pagosanticipocom", ["FPC_CODIGO"], name: "IX_FPCCOMPRA", using: :btree

  create_table "pagosanticipoven", primary_key: "PAV_CODIGO", force: :cascade do |t|
    t.integer "FPV_CODIGO", limit: 4
    t.decimal "PAV_VALOR",            precision: 38, scale: 2
    t.integer "ANT_CODIGO", limit: 4
  end

  add_index "pagosanticipoven", ["ANT_CODIGO"], name: "FK_ANTICIPOS_idx", using: :btree
  add_index "pagosanticipoven", ["ANT_CODIGO"], name: "IX_ANTICIPOS", using: :btree
  add_index "pagosanticipoven", ["FPV_CODIGO"], name: "FKFPVANTICIPOS_idx", using: :btree
  add_index "pagosanticipoven", ["FPV_CODIGO"], name: "IX_FPVPAGOS", using: :btree

  create_table "pagosgiftcard", primary_key: "PGI_CODIGO", force: :cascade do |t|
    t.integer "FPV_CODIGO", limit: 4,                          null: false
    t.decimal "PGI_DEBITO",           precision: 38, scale: 2
    t.integer "GIF_CODIGO", limit: 4
  end

  add_index "pagosgiftcard", ["FPV_CODIGO"], name: "IX_FPV_CODIGO", using: :btree
  add_index "pagosgiftcard", ["GIF_CODIGO"], name: "IX_GIF_CODIGO", using: :btree

  create_table "paises", id: false, force: :cascade do |t|
    t.integer "PAI_CODIGO",        limit: 4,  default: 0, null: false
    t.string  "PAI_NOMBRE",        limit: 50
    t.integer "PAI_INTERNACIONAL", limit: 4,  default: 0, null: false
  end

  create_table "parentescos", id: false, force: :cascade do |t|
    t.integer "CLI_CODIGO",     limit: 4,   null: false
    t.integer "CLI_CODIGOP",    limit: 4,   null: false
    t.string  "PRS_PARENTESCO", limit: 100, null: false
  end

  add_index "parentescos", ["CLI_CODIGO", "CLI_CODIGOP"], name: "PRINCIPAL", unique: true, using: :btree
  add_index "parentescos", ["CLI_CODIGO"], name: "CLIENTE", using: :btree
  add_index "parentescos", ["CLI_CODIGOP"], name: "PARIENTE", using: :btree

  create_table "partidasar", primary_key: "PAR_CODIGO", force: :cascade do |t|
    t.string  "PAR_DESIGNACION",   limit: 293
    t.string  "PAR_UF",            limit: 8
    t.string  "PAR_TARIFA",        limit: 49
    t.string  "PAR_OBSERVACIONES", limit: 821
    t.integer "PAR_ESTADO",        limit: 4,   default: 1
  end

  create_table "pedidos", primary_key: "PED_CODIGO", force: :cascade do |t|
    t.datetime "PED_FECHAREGISTRO"
    t.string   "PED_OBSERVACIONES", limit: 100
    t.decimal  "PED_TOTAL",                     precision: 38, scale: 4, default: 0.0, null: false
    t.decimal  "PED_SUBTOTALIVA",               precision: 38, scale: 4, default: 0.0, null: false
    t.decimal  "PED_SUBTOTAL0",                 precision: 38, scale: 4, default: 0.0, null: false
    t.decimal  "PED_DESCUENTO",                 precision: 38, scale: 4, default: 0.0, null: false
    t.integer  "VDR_CODIGO",        limit: 4
    t.integer  "CLI_CODIGO",        limit: 4
    t.integer  "ESP_CODIGO",        limit: 4
    t.integer  "VEN_CODIGO",        limit: 4
  end

  add_index "pedidos", ["CLI_CODIGO"], name: "CLIENTESFK_idx", using: :btree
  add_index "pedidos", ["ESP_CODIGO"], name: "ESTADOPEDIDO_idx", using: :btree
  add_index "pedidos", ["VDR_CODIGO"], name: "VENDEDORES_idx", using: :btree
  add_index "pedidos", ["VEN_CODIGO"], name: "VENTAS_idx", using: :btree

  create_table "perfiles", primary_key: "PER_CODIGO", force: :cascade do |t|
    t.datetime "PER_REGISTRO"
    t.string   "PER_NOMBRE",   limit: 200
    t.integer  "PER_ESTADO",   limit: 4
  end

  create_table "perfiles_menu", primary_key: "PEM_CODIGO", force: :cascade do |t|
    t.integer  "PER_CODIGO",    limit: 4
    t.integer  "MEN_CODIGO",    limit: 4
    t.datetime "PEM_REGISTRO"
    t.integer  "PEM_ACCESO",    limit: 4
    t.integer  "PEM_CONSULTA",  limit: 4
    t.integer  "PEM_AGREGAR",   limit: 4
    t.integer  "PEM_MODIFICAR", limit: 4
    t.integer  "PEM_ELIMINAR",  limit: 4
  end

  create_table "periodos", primary_key: "PER_CODIGO", force: :cascade do |t|
    t.datetime "PER_FINICIO",           null: false
    t.datetime "PER_FCIERRE",           null: false
    t.integer  "PER_ANIO",    limit: 4, null: false
    t.integer  "PER_MES",     limit: 4, null: false
    t.integer  "PER_DIARIO",  limit: 4
    t.integer  "PER_USO",     limit: 4
  end

  create_table "permisos", primary_key: "PER_CODIGO", force: :cascade do |t|
    t.integer "MEB_CODIGO",   limit: 4, null: false
    t.integer "PER_ASIGNADO", limit: 4, null: false
    t.integer "PER_TIPO",     limit: 4, null: false
  end

  add_index "permisos", ["MEB_CODIGO", "PER_ASIGNADO"], name: "IX_PERMISOS", unique: true, using: :btree

  create_table "plan_cuentas", primary_key: "PLA_CODIGO", force: :cascade do |t|
    t.string  "PLA_NUMERO",        limit: 200,                                       null: false
    t.string  "PLA_DESCRIPCION",   limit: 250,                                       null: false
    t.string  "PLA_DESCIDIOMA",    limit: 250,                                       null: false
    t.integer "PLA_CATEGORIA",     limit: 4,                                         null: false
    t.decimal "PLA_SALDO_INICIAL",             precision: 38, scale: 4,              null: false
    t.decimal "PLA_SALDO_FINAL",               precision: 38, scale: 4,              null: false
    t.integer "PLA_ESTADO",        limit: 4,                                         null: false
    t.integer "TIP_CODIGO",        limit: 4,                                         null: false
    t.integer "PLA_PADRE",         limit: 4
    t.integer "PLA_ORDEN",         limit: 4,                                         null: false
    t.integer "PLA_OPERACION",     limit: 4
    t.integer "PLA_NIVEL",         limit: 4
    t.integer "PLA_FISCAL",        limit: 4
    t.string  "PLF_NUMERO",        limit: 100,                          default: "", null: false
  end

  add_index "plan_cuentas", ["TIP_CODIGO"], name: "TIP_CODIGO", using: :btree

  create_table "planflujos", primary_key: "PLF_NUMERO", force: :cascade do |t|
    t.string  "PLF_DESCRIPCION", limit: 250,               null: false
    t.integer "PLF_CATEGORIA",   limit: 4,                 null: false
    t.string  "PLF_PERTENECE",   limit: 100, default: "",  null: false
    t.string  "PLF_MOVIMIENTO",  limit: 1,   default: "D", null: false
  end

  create_table "plantillas", primary_key: "PLL_CODIGO", force: :cascade do |t|
    t.string  "PLL_TIPO",        limit: 50,    null: false
    t.binary  "PLL_DESCRIPCION", limit: 65535, null: false
    t.integer "PLL_ESTADO",      limit: 4,     null: false
  end

  create_table "plantillasitems", primary_key: "PLI_CODIGO", force: :cascade do |t|
    t.integer "PLL_CODIGO",    limit: 4,   null: false
    t.integer "ITE_CODIGO",    limit: 4,   null: false
    t.string  "PLI_PARAMETRO", limit: 150, null: false
  end

  create_table "posiciongema", primary_key: "PSG_CODIGO", force: :cascade do |t|
    t.string "PSG_DESCRIPCION", limit: 45
    t.string "PSG_ESTADO",      limit: 45
  end

  create_table "pre_ventas", primary_key: "PVE_CODIGO", force: :cascade do |t|
    t.integer  "MES_FACTURACION",     limit: 4,   null: false
    t.integer  "ANIO_FACTURACION",    limit: 4,   null: false
    t.integer  "ITE_CODIGO",          limit: 4
    t.integer  "VEN_CODIGO",          limit: 4
    t.integer  "CTR_CODIGO",          limit: 4
    t.integer  "PVE_ESTADO",          limit: 4
    t.string   "PVE_DESCRIPCION",     limit: 100
    t.integer  "PVE_TIPODOC",         limit: 4,   null: false
    t.datetime "VEN_FECHA"
    t.string   "VEN_NUMERO",          limit: 9,   null: false
    t.string   "VEN_AUTORIZACION",    limit: 50,  null: false
    t.string   "VEN_ESTABLECIMIENTO", limit: 3
    t.string   "VEN_PTOEMISION",      limit: 3
  end

  add_index "pre_ventas", ["VEN_CODIGO"], name: "preventas_ven_codigo", using: :btree

  create_table "precontratos", primary_key: "PRC_CODIGO", force: :cascade do |t|
    t.integer  "PRC_NUMERO", limit: 4, null: false
    t.datetime "PRC_FECHA",            null: false
    t.integer  "CIU_CODIGO", limit: 4, null: false
    t.integer  "HTR_CODIGO", limit: 4, null: false
    t.integer  "ORO_CODIGO", limit: 4, null: false
    t.integer  "USU_CODIGO", limit: 4, null: false
    t.integer  "PRC_ESTADO", limit: 4, null: false
  end

  create_table "profinteldetalles", force: :cascade do |t|
    t.decimal  "cantidad",                       precision: 10, scale: 4, default: 1.0,   null: false
    t.decimal  "medida_ancho",                   precision: 10, scale: 2
    t.decimal  "medida_alto",                    precision: 10, scale: 2
    t.decimal  "medida_largo",                   precision: 10, scale: 2
    t.decimal  "valor_unitario",                 precision: 18, scale: 8,                 null: false
    t.integer  "proformaintel_id",     limit: 4
    t.integer  "kitbase_id",           limit: 4
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.decimal  "porcentaje_descuento",           precision: 10, scale: 8, default: 0.0,   null: false
    t.boolean  "utilidad_global",                                         default: false, null: false
    t.decimal  "porcentaje_utilidad",            precision: 18, scale: 8, default: 0.0,   null: false
  end

  add_index "profinteldetalles", ["kitbase_id"], name: "fk_rails_12690c0de0", using: :btree
  add_index "profinteldetalles", ["proformaintel_id"], name: "fk_rails_9b9c529d05", using: :btree

  create_table "proformaintels", force: :cascade do |t|
    t.string   "forma_pago",       limit: 255
    t.string   "forma_entrega",    limit: 255
    t.string   "tiempo_entrega",   limit: 255
    t.integer  "sucursal_id",      limit: 4
    t.integer  "responsable_id",   limit: 4
    t.integer  "cliente_id",       limit: 4
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.decimal  "descuento_global",             precision: 18, scale: 8, default: 0.0, null: false
  end

  add_index "proformaintels", ["cliente_id"], name: "fk_rails_87334553bd", using: :btree
  add_index "proformaintels", ["responsable_id"], name: "fk_rails_7dd7205019", using: :btree

  create_table "proformas_vehiculo", primary_key: "PRO_CODIGO", force: :cascade do |t|
    t.text    "PRO_ARCHIVO", limit: 65535, null: false
    t.integer "CVV_CODIGO",  limit: 4,     null: false
  end

  create_table "promociones", primary_key: "PMO_CODIGO", force: :cascade do |t|
    t.integer  "ITE_CODIGO",      limit: 4
    t.datetime "PMO_DESDE",                                            null: false
    t.datetime "PMO_HASTA",                                            null: false
    t.string   "PMO_DESCRIPCION", limit: 250
    t.decimal  "PMO_DESCUENTO",               precision: 38, scale: 2, null: false
  end

  add_index "promociones", ["ITE_CODIGO"], name: "FK_PROMOCIONES_ITEMS", using: :btree

  create_table "promoitems", primary_key: "PMI_CODIGO", force: :cascade do |t|
    t.integer "PMV_CODIGO", limit: 4, null: false
    t.integer "ITE_CODIGO", limit: 4, null: false
  end

  add_index "promoitems", ["PMV_CODIGO"], name: "PMV_CODIGO", using: :btree

  create_table "promotardetalle", primary_key: "PTD_CODIGO", force: :cascade do |t|
    t.integer "PRT_CODIGO",    limit: 4,                          null: false
    t.integer "PTO_CODIGO",    limit: 4,                          null: false
    t.integer "ITE_CODIGO",    limit: 4,                          null: false
    t.integer "PTD_CANTIDAD",  limit: 4,                          null: false
    t.decimal "PTD_DESCUENTO",           precision: 38, scale: 2, null: false
  end

  add_index "promotardetalle", ["PRT_CODIGO"], name: "PRT_CODIGO", using: :btree

  create_table "promotarjetas", primary_key: "PRT_CODIGO", force: :cascade do |t|
    t.datetime "PRT_DESDE",                   null: false
    t.datetime "PRT_HASTA",                   null: false
    t.string   "PRT_DESCRIPCION", limit: 250, null: false
    t.integer  "GIF_TIPO",        limit: 4,   null: false
    t.integer  "PRT_ESTADO",      limit: 4,   null: false
  end

  create_table "promoventas", primary_key: "PMV_CODIGO", force: :cascade do |t|
    t.string   "PMV_NUMERO",      limit: 250, null: false
    t.string   "PMV_DESCRIPCION", limit: 250, null: false
    t.datetime "PMV_FINICIO",                 null: false
    t.datetime "PMV_FFINAL",                  null: false
    t.integer  "PMV_TPROMOCION",  limit: 4,   null: false
    t.integer  "PMV_APLICACION",  limit: 4,   null: false
    t.integer  "TAR_CODIGO",      limit: 4,   null: false
    t.integer  "PMV_DESCUENTO",   limit: 4,   null: false
    t.integer  "PMV_ESTADO",      limit: 4,   null: false
  end

  create_table "proveedores", primary_key: "PRV_CODIGO", force: :cascade do |t|
    t.string   "PRV_TIPOIDE",        limit: 2,                                          null: false
    t.string   "PRV_IDENTIFICACION", limit: 50,                                         null: false
    t.string   "PRV_TRIBUTARIO",     limit: 2
    t.datetime "PRV_FREGISTRO"
    t.string   "PRV_NOMBRE",         limit: 250,                                        null: false
    t.string   "PRV_RCOMERCIAL",     limit: 250
    t.string   "PRV_DIRECCION",      limit: 250,                                        null: false
    t.string   "PRV_TELEFONO",       limit: 20,                                         null: false
    t.string   "PRV_FAX",            limit: 20
    t.string   "PRV_CELULAR",        limit: 20
    t.string   "PRV_EMAIL",          limit: 500
    t.integer  "PRV_UBICACION",      limit: 4
    t.integer  "PRV_CLASIFICACION",  limit: 4
    t.integer  "PRV_DIASCREDITO",    limit: 4
    t.decimal  "PRV_LIMCREDITO",                 precision: 38, scale: 4
    t.decimal  "PRV_DESCUENTO",                  precision: 38, scale: 4
    t.string   "PRV_ATECOMPRAS",     limit: 200
    t.string   "PRV_ATEPAGOS",       limit: 200
    t.decimal  "PRV_SALDO",                      precision: 38, scale: 4, default: 0.0
    t.decimal  "PRV_CANUALES",                   precision: 38, scale: 4
    t.datetime "PRV_FUPAGO",                                                            null: false
    t.string   "PRV_DUPAGO",         limit: 50
    t.decimal  "PRV_MONTOPAGO",                  precision: 38, scale: 4
    t.datetime "PRV_FUCOMPRA",                                                          null: false
    t.string   "PRV_DUCOMPRA",       limit: 150
    t.decimal  "PRV_MONTOCOMPRA",                precision: 38, scale: 4
    t.string   "PRV_OBSERVACIONES",  limit: 256
    t.string   "PRV_WEB",            limit: 250
    t.integer  "PRV_TIPOEMPRESA",    limit: 4
    t.integer  "PRV_ESPECIALIDAD",   limit: 4
    t.integer  "TAG_CODIGO",         limit: 4,                                          null: false
    t.integer  "PRV_SEGUROS",        limit: 4,                            default: 0,   null: false
    t.integer  "PRV_ARTESANOS",      limit: 4,                            default: 0
    t.string   "TPR_CODIGO",         limit: 2
    t.string   "PRV_RELACIONADO",    limit: 2
    t.integer  "PRV_ESTADO",         limit: 4,                            default: 1,   null: false
  end

  add_index "proveedores", ["PRV_IDENTIFICACION", "PRV_ESTADO"], name: "IX_PROVEEDORES", unique: true, using: :btree
  add_index "proveedores", ["PRV_TIPOIDE"], name: "FK_PROVEEDORES_TIPO_IDENTIFICACION", using: :btree
  add_index "proveedores", ["TPR_CODIGO"], name: "FK_TIPOPROVEEDOR_idx", using: :btree
  add_index "proveedores", ["TPR_CODIGO"], name: "IX_TIPOPROVEEDOR", using: :btree

  create_table "proveedoresporpagar", id: false, force: :cascade do |t|
    t.integer  "PRV_CODIGO",          limit: 4
    t.string   "PRV_IDENTIFICACION",  limit: 50
    t.string   "PRV_NOMBRE",          limit: 250
    t.string   "PRV_DIRECCION",       limit: 250
    t.string   "PRV_TELEFONO",        limit: 20
    t.string   "PRV_EMAIL",           limit: 500
    t.integer  "PRV_UBICACION",       limit: 4
    t.integer  "COM_CODIGO",          limit: 4
    t.string   "COM_ESTABLECIMIENTO", limit: 3
    t.string   "COM_PTOEMISION",      limit: 3
    t.string   "COM_NUMERO",          limit: 20
    t.datetime "COM_FECHA",                                                null: false
    t.string   "COM_TIPODOC",         limit: 2
    t.decimal  "COM_TOTAL",                       precision: 38, scale: 4
    t.integer  "FPC_CODIGO",          limit: 4
    t.decimal  "FPC_VALOR",                       precision: 38, scale: 4
    t.integer  "PCO_CODIGO",          limit: 4
    t.datetime "PCO_VENCIMIENTO",                                          null: false
    t.decimal  "CUOTA",                           precision: 60, scale: 4
    t.decimal  "PAGO",                            precision: 60, scale: 4
  end

  create_table "provincias", id: false, force: :cascade do |t|
    t.integer "PRO_CODIGO",     limit: 4,  default: 0, null: false
    t.string  "PRO_NOMBRE",     limit: 50
    t.integer "PAI_CODIGO",     limit: 4
    t.integer "PRO_RDEPCODIGO", limit: 4,  default: 0, null: false
    t.string  "PRO_INEC",       limit: 2,              null: false
  end

  create_table "proyectos", primary_key: "PRO_CODIGO", force: :cascade do |t|
    t.string   "PRO_NUMERO",      limit: 7,                 null: false
    t.datetime "PRO_DESDE",                                 null: false
    t.datetime "PRO_HASTA"
    t.integer  "CLI_CODIGO",      limit: 4,                 null: false
    t.text     "PRO_DESCRIPCION", limit: 65535
    t.integer  "USU_CODIGO",      limit: 4,                 null: false
    t.integer  "PRO_ESTADO",      limit: 4,     default: 1, null: false
  end

  create_table "proyectos_detalle", primary_key: "PDE_CODIGO", force: :cascade do |t|
    t.string  "PDE_ITEM",   limit: 45, null: false
    t.string  "PDE_TIPO",   limit: 45, null: false
    t.integer "PRO_CODIGO", limit: 4,  null: false
  end

  create_table "pto_aut_imp", id: false, force: :cascade do |t|
    t.integer "PTO_CODIGO", limit: 4,              null: false
    t.integer "AUT_CODIGO", limit: 4,              null: false
    t.integer "IMP_CODIGO", limit: 4,              null: false
    t.string  "IPS_NOMBRE", limit: 50,             null: false
    t.integer "IMP_COPIAS", limit: 4,  default: 1, null: false
    t.integer "IPR_CODIGO", limit: 4
  end

  add_index "pto_aut_imp", ["AUT_CODIGO"], name: "FK_AUT", using: :btree
  add_index "pto_aut_imp", ["IMP_CODIGO"], name: "FK_IMP", using: :btree
  add_index "pto_aut_imp", ["IPR_CODIGO"], name: "IPR_CODIGO", using: :btree
  add_index "pto_aut_imp", ["PTO_CODIGO"], name: "FK_PTO", using: :btree

  create_table "punto_venta", primary_key: "PTO_CODIGO", force: :cascade do |t|
    t.string  "PTO_HOST",        limit: 50
    t.integer "LOC_CODIGO",      limit: 4
    t.string  "PTO_ESPECIAL",    limit: 50
    t.string  "PTO_MAC",         limit: 50
    t.string  "PTO_USO",         limit: 50
    t.integer "PTO_RESTAURANTE", limit: 4,  default: 0,  null: false
    t.integer "PTO_TORDEN",      limit: 4,               null: false
    t.integer "PTO_IMPRESION",   limit: 4,  default: 0,  null: false
    t.integer "PTO_EMULA",       limit: 4,  default: -1, null: false
    t.integer "PTO_ESTADO",      limit: 4,  default: 1
  end

  add_index "punto_venta", ["PTO_EMULA"], name: "PTO_EMULA", using: :btree
  add_index "punto_venta", ["PTO_HOST"], name: "IX_PUNTO_VENTA_PTO_HOST", unique: true, using: :btree

  create_table "pventaitem", primary_key: "PVI_CODIGO", force: :cascade do |t|
    t.integer  "PTO_CODIGO",   limit: 4, null: false
    t.integer  "ITE_CODIGO",   limit: 4, null: false
    t.integer  "GIF_CODIGO",   limit: 4, null: false
    t.integer  "PVI_CANTIDAD", limit: 4, null: false
    t.datetime "PVI_FECHA",              null: false
  end

  create_table "quienrecibe", primary_key: "QUE_CODIGO", force: :cascade do |t|
    t.integer "CLI_CODIGO",    limit: 4
    t.string  "QUE_NOMBRE",    limit: 100
    t.string  "QUE_PAIS",      limit: 50
    t.string  "QUE_CIUDAD",    limit: 50
    t.string  "QUE_DIRECCION", limit: 250
    t.string  "QUE_TELEFONO",  limit: 50
  end

  create_table "recepcion_bodegadetalles", force: :cascade do |t|
    t.decimal "cantidad",                      precision: 38, scale: 4, null: false
    t.decimal "costo",                         precision: 38, scale: 4, null: false
    t.decimal "valor",                         precision: 38, scale: 4
    t.integer "iva_id",              limit: 4,                          null: false
    t.integer "local_id",            limit: 4,                          null: false
    t.integer "estado_id",           limit: 4
    t.integer "movcabecera_id",      limit: 4
    t.integer "item_id",             limit: 4,                          null: false
    t.integer "recepcionbodegas_id", limit: 4
  end

  add_index "recepcion_bodegadetalles", ["item_id"], name: "recepcionbodega_itemfk_idx", using: :btree
  add_index "recepcion_bodegadetalles", ["movcabecera_id"], name: "recepciondetbodega_movimientofk_idx", using: :btree
  add_index "recepcion_bodegadetalles", ["recepcionbodegas_id"], name: "recepciondetbodega_cabecerafk_idx", using: :btree

  create_table "recepcion_bodegas", force: :cascade do |t|
    t.string   "numero",        limit: 10
    t.datetime "fecha"
    t.string   "observaciones", limit: 100
    t.integer  "estado",        limit: 4
  end

  add_index "recepcion_bodegas", ["numero"], name: "REC_NUMERO_UNIQUE", unique: true, using: :btree

  create_table "reembolsoscom", primary_key: "REM_CODIGO", force: :cascade do |t|
    t.string   "REM_TIPODOC",         limit: 2,                           null: false
    t.datetime "REM_FECHA",                                               null: false
    t.string   "REM_NUMERO",          limit: 9,                           null: false
    t.string   "REM_AUTORIZACION",    limit: 50,                          null: false
    t.string   "REM_ESTABLECIMIENTO", limit: 3,                           null: false
    t.string   "REM_PTOEMISION",      limit: 3,                           null: false
    t.decimal  "REM_SUBTOTAL0",                  precision: 38, scale: 4, null: false
    t.decimal  "REM_SUBTOTAL12",                 precision: 38, scale: 4, null: false
    t.decimal  "REM_SUBTOTALNOIVA",              precision: 38, scale: 4, null: false
    t.decimal  "REM_ICE",                        precision: 38, scale: 4, null: false
    t.decimal  "REM_IVA",                        precision: 38, scale: 4, null: false
    t.integer  "COM_CODIGO",          limit: 4,                           null: false
    t.integer  "PRV_CODIGO",          limit: 4,                           null: false
    t.integer  "REM_ESTADO",          limit: 4,                           null: false
    t.datetime "REM_FECHAP"
  end

  create_table "reembolsosven", primary_key: "REM_CODIGO", force: :cascade do |t|
    t.string   "REM_TIPODOC",         limit: 2,                           null: false
    t.datetime "REM_FECHA",                                               null: false
    t.string   "REM_NUMERO",          limit: 9,                           null: false
    t.string   "REM_AUTORIZACION",    limit: 50,                          null: false
    t.string   "REM_ESTABLECIMIENTO", limit: 3,                           null: false
    t.string   "REM_PTOEMISION",      limit: 3,                           null: false
    t.decimal  "REM_SUBTOTAL0",                  precision: 38, scale: 4, null: false
    t.decimal  "REM_SUBTOTAL12",                 precision: 38, scale: 4, null: false
    t.decimal  "REM_SUBTOTALNOIVA",              precision: 38, scale: 4, null: false
    t.decimal  "REM_ICE",                        precision: 38, scale: 4, null: false
    t.decimal  "REM_IVA",                        precision: 38, scale: 4, null: false
    t.integer  "VEN_CODIGO",          limit: 4,                           null: false
    t.integer  "CLI_CODIGO",          limit: 4,                           null: false
    t.integer  "REM_ESTADO",          limit: 4,                           null: false
    t.datetime "REM_FECHAN"
  end

  create_table "regimen", primary_key: "REG_CODIGO", force: :cascade do |t|
    t.string  "REG_DESCRIPCION", limit: 250, null: false
    t.integer "REG_ESTADO",      limit: 4,   null: false
  end

  create_table "registro", primary_key: "REG_CODIGO", force: :cascade do |t|
    t.integer  "USU_CODIGO",        limit: 4
    t.datetime "REG_FECHA"
    t.text     "REG_OBSERVACIONES", limit: 4294967295
    t.integer  "HOR_CODIGO",        limit: 4,          null: false
  end

  create_table "rentas_empleados", primary_key: "REM_CODIGO", force: :cascade do |t|
    t.decimal "REM_VIVIENDA",                 precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_SALUD",                    precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_EDUCACION",                precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_ALIMENTACION",             precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_VESTIMENTA",               precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_DISCAPACITADOS",           precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_TERCERAEDAD",              precision: 38, scale: 4, default: 0.0, null: false
    t.integer "REM_ANIO",           limit: 4,                                        null: false
    t.integer "USU_CODIGO",         limit: 4,                                        null: false
    t.decimal "REM_RENTA",                    precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_INGRESOS",                 precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_DEDUCCIONES",              precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_REBAJAS",                  precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_RETENCION",                precision: 38, scale: 4, default: 0.0, null: false
    t.decimal "REM_ROTROS",                   precision: 38, scale: 4, default: 0.0, null: false
    t.integer "REM_RETENCIONES",    limit: 4,                          default: 0,   null: false
  end

  create_table "reservaciones", primary_key: "RES_CODIGO", force: :cascade do |t|
    t.string   "RES_NUMERO",         limit: 10,    null: false
    t.datetime "RES_FREGISTRO",                    null: false
    t.datetime "RES_FEVENTO",                      null: false
    t.string   "RES_HENTRADA",       limit: 6,     null: false
    t.string   "RES_HSALIDA",        limit: 6,     null: false
    t.integer  "RES_ADULTOS",        limit: 4,     null: false
    t.integer  "RES_NINOS",          limit: 4,     null: false
    t.integer  "RES_DISCAPACITADOS", limit: 4,     null: false
    t.integer  "RES_TEDAD",          limit: 4,     null: false
    t.string   "RES_OBSERVACIONES",  limit: 250,   null: false
    t.integer  "EVE_CODIGO",         limit: 4,     null: false
    t.integer  "CLI_CODIGO",         limit: 4,     null: false
    t.integer  "VEN_CODIGO",         limit: 4,     null: false
    t.integer  "USU_CODIGO",         limit: 4,     null: false
    t.text     "RES_PLANTILLA",      limit: 65535, null: false
    t.integer  "PLL_CODIGO",         limit: 4,     null: false
    t.integer  "RES_ESTADO",         limit: 4,     null: false
  end

  create_table "responsable", primary_key: "RES_CODIGO", force: :cascade do |t|
    t.string  "RES_NOMBRE",         limit: 250, null: false
    t.string  "RES_IDENTIFICACION", limit: 15,  null: false
    t.string  "RES_PROFESION",      limit: 250, null: false
    t.string  "RES_DIRECCION",      limit: 250, null: false
    t.integer "CIU_CODIGO",         limit: 4,   null: false
    t.string  "RES_TELEFONO",       limit: 15,  null: false
  end

  create_table "ret_pro_cli", primary_key: "RPC_CODIGO", force: :cascade do |t|
    t.string  "RPC_TIPO",      limit: 50, null: false
    t.integer "RPC_ID",        limit: 4,  null: false
    t.integer "RPC_IMPUESTO",  limit: 4
    t.integer "RPC_RETENCION", limit: 4,  null: false
  end

  create_table "ret_tarjeta", primary_key: "RET_CODIGO", force: :cascade do |t|
    t.integer "TAR_CODIGO", limit: 4
    t.integer "CON_TIPO",   limit: 4
    t.integer "CON_CODIGO", limit: 4
  end

  create_table "retazosproduccions", force: :cascade do |t|
    t.integer  "orden_id",        limit: 4
    t.integer  "itemnuevo_id",    limit: 4
    t.integer  "itemoriginal_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "hojaitem_id",     limit: 4
    t.integer  "tipo",            limit: 4, null: false
  end

  add_index "retazosproduccions", ["hojaitem_id"], name: "fk_rails_5167daa257", using: :btree
  add_index "retazosproduccions", ["itemnuevo_id"], name: "fk_rails_3f12710f05", using: :btree
  add_index "retazosproduccions", ["itemoriginal_id"], name: "fk_rails_cdf051c317", using: :btree
  add_index "retazosproduccions", ["orden_id"], name: "fk_rails_98a9ba73bf", using: :btree

  create_table "retencion_com", primary_key: "REC_CODIGO", force: :cascade do |t|
    t.string   "REC_AUTORIZACION",    limit: 50,                                      null: false
    t.string   "REC_ESTABLECIMIENTO", limit: 3,                                       null: false
    t.string   "REC_PTOEMISION",      limit: 3,                                       null: false
    t.string   "REC_NUMERO",          limit: 9,                                       null: false
    t.datetime "REC_FECHA",                                                           null: false
    t.decimal  "REC_TOTAL",                      precision: 38, scale: 4,             null: false
    t.integer  "COM_CODIGO",          limit: 4,                                       null: false
    t.integer  "USU_CODIGO",          limit: 4,                                       null: false
    t.integer  "LOC_CODIGO",          limit: 4,                                       null: false
    t.integer  "REC_IMPRESO",         limit: 4,                           default: 0, null: false
    t.integer  "REC_FPAGO",           limit: 4
    t.integer  "REC_ESTADO",          limit: 4,                           default: 3, null: false
  end

  add_index "retencion_com", ["COM_CODIGO"], name: "COM_RETENCION", using: :btree
  add_index "retencion_com", ["REC_ESTABLECIMIENTO", "REC_PTOEMISION", "REC_NUMERO", "REC_ESTADO"], name: "UNICO", unique: true, using: :btree

  create_table "retencion_com_detalle", primary_key: "RCD_CODIGO", force: :cascade do |t|
    t.integer "REC_CODIGO",     limit: 4,                            null: false
    t.integer "RCD_EFISCAL",    limit: 4,                            null: false
    t.decimal "RCD_BASE",                   precision: 38, scale: 4, null: false
    t.decimal "RCD_PORCENTAJE",             precision: 38, scale: 4, null: false
    t.decimal "RCD_VALOR",                  precision: 38, scale: 4, null: false
    t.string  "CON_CODIGO",     limit: 10,                           null: false
    t.string  "CON_IMPUESTO",   limit: 250,                          null: false
  end

  add_index "retencion_com_detalle", ["REC_CODIGO"], name: "FK_RETENCION_COM_DETALLE_RETENCION_COM", using: :btree

  create_table "retencion_ven", primary_key: "REV_CODIGO", force: :cascade do |t|
    t.string   "REV_AUTORIZACION",    limit: 50,                                      null: false
    t.string   "REV_ESTABLECIMIENTO", limit: 3,                                       null: false
    t.string   "REV_PTOEMISION",      limit: 3,                                       null: false
    t.string   "REV_NUMERO",          limit: 9,                                       null: false
    t.datetime "REV_FECHA",                                                           null: false
    t.decimal  "REV_TOTAL",                      precision: 38, scale: 4,             null: false
    t.integer  "VEN_CODIGO",          limit: 4,                                       null: false
    t.integer  "USU_CODIGO",          limit: 4,                                       null: false
    t.integer  "EMP_CODIGO",          limit: 4,                                       null: false
    t.integer  "REV_FPAGO",           limit: 4
    t.integer  "REV_ESTADO",          limit: 4,                           default: 3, null: false
  end

  add_index "retencion_ven", ["REV_ESTABLECIMIENTO", "REV_PTOEMISION", "REV_NUMERO", "VEN_CODIGO", "REV_ESTADO"], name: "UNICO", unique: true, using: :btree
  add_index "retencion_ven", ["VEN_CODIGO"], name: "VEN_RETENCION", using: :btree

  create_table "retencion_ven_detalle", primary_key: "RVD_CODIGO", force: :cascade do |t|
    t.integer "REV_CODIGO",     limit: 4,                            null: false
    t.integer "RVD_EFISCAL",    limit: 4,                            null: false
    t.decimal "RVD_BASE",                   precision: 38, scale: 4, null: false
    t.decimal "RVD_PORCENTAJE",             precision: 38, scale: 4, null: false
    t.decimal "RVD_VALOR",                  precision: 38, scale: 4, null: false
    t.string  "CON_CODIGO",     limit: 10,                           null: false
    t.string  "CON_IMPUESTO",   limit: 250,                          null: false
  end

  add_index "retencion_ven_detalle", ["REV_CODIGO"], name: "FK_RETENCION_VEN_DETALLE_RETENCION_VEN", using: :btree

  create_table "roles", primary_key: "ROL_CODIGO", force: :cascade do |t|
    t.string  "ROL_DESCRIPCION",  limit: 50,                null: false
    t.text    "ROL_CONTRATO",     limit: 65535
    t.integer "ROL_ESTADO",       limit: 4,     default: 1, null: false
    t.integer "ROL_ACTUALIZABLE", limit: 4,     default: 0
  end

  create_table "rolpagos", primary_key: "RPA_CODIGO", force: :cascade do |t|
    t.integer  "USU_CODIGO",        limit: 4,                                                 null: false
    t.datetime "RPA_FREGISTRO"
    t.datetime "RPA_FCOBRO"
    t.datetime "RPA_FLABOR",                                                                  null: false
    t.string   "RPA_DIAS",          limit: 6,                              default: "000000", null: false
    t.decimal  "RPA_SUELDO",                      precision: 38, scale: 2,                    null: false
    t.string   "RPA_JORNADA",       limit: 5,                              default: "00000",  null: false
    t.decimal  "RPA_PJORNADA",                    precision: 38, scale: 2
    t.decimal  "RPA_VJORNADA",                    precision: 38, scale: 2
    t.decimal  "RPA_HSUPLE",                      precision: 38, scale: 2
    t.decimal  "RPA_PSUPLE",                      precision: 38, scale: 2
    t.decimal  "RPA_VSUPLE",                      precision: 38, scale: 2
    t.decimal  "RPA_HEXTRA",                      precision: 38, scale: 2
    t.decimal  "RPA_PEXTRA",                      precision: 38, scale: 2
    t.decimal  "RPA_VEXTRA",                      precision: 38, scale: 2
    t.decimal  "RPA_COMISIONES",                  precision: 38, scale: 2
    t.decimal  "RPA_PIESS_P",                     precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_PIESS",                       precision: 38, scale: 2
    t.decimal  "RPA_IESS_P",                      precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_IESS",                        precision: 38, scale: 2
    t.decimal  "RPA_SECAP_P",                     precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_SECAP",                       precision: 38, scale: 2
    t.decimal  "RPA_IECE_P",                      precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_IECE",                        precision: 38, scale: 2
    t.decimal  "RPA_AJUSTESUELDO",                precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_PRESTAMOS",                   precision: 38, scale: 2
    t.decimal  "RPA_BONOS",                       precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_PRESTAMOS_Q",                 precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_PRESTAMOS_H",                 precision: 38, scale: 4, default: 0.0
    t.decimal  "RPA_ANTICIPOS",                   precision: 38, scale: 2
    t.decimal  "RPA_DESCUENTOS",                  precision: 38, scale: 2
    t.decimal  "RPA_RENTA",                       precision: 38, scale: 2
    t.decimal  "RPA_FRESERVA",                    precision: 38, scale: 2
    t.decimal  "RPA_MULTAS",                      precision: 38, scale: 2
    t.decimal  "RPA_REMPLAZO",                    precision: 38, scale: 2
    t.decimal  "RPA_BONIFICACION",                precision: 38, scale: 2
    t.integer  "RPA_FPAGO",         limit: 4
    t.integer  "RPA_ACUMULAFR",     limit: 4,                                                 null: false
    t.decimal  "RPA_NOMINAL",                     precision: 38, scale: 4,                    null: false
    t.decimal  "RPA_UNIFICADO",                   precision: 38, scale: 4,                    null: false
    t.text     "RPA_OBSERVACIONES", limit: 65535
    t.decimal  "RPA_VACACIONES",                  precision: 38, scale: 2, default: 0.0,      null: false
    t.integer  "RPA_CONVACACIONES", limit: 4,                              default: 0,        null: false
    t.integer  "RPA_PAGARIESS",     limit: 4,                              default: 0,        null: false
    t.decimal  "RPA_DTERCERO",                    precision: 38, scale: 2, default: 0.0,      null: false
    t.decimal  "RPA_DCUARTO",                     precision: 38, scale: 2, default: 0.0,      null: false
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

  create_table "rotulacion", primary_key: "ROT_CODIGO", force: :cascade do |t|
    t.string "ROT_DENOMINACION", limit: 250
    t.string "ROT_EMPLEO",       limit: 250
  end

  create_table "salones", primary_key: "SAL_CODIGO", force: :cascade do |t|
    t.string  "SAL_NOMBRE",    limit: 250, null: false
    t.string  "SAL_UBICACION", limit: 250, null: false
    t.integer "SAL_ESTADO",    limit: 4,   null: false
  end

  create_table "secuenciales_transacciones", id: false, force: :cascade do |t|
    t.string "TIC_CODIGO", limit: 2, null: false
    t.string "IDE_CODIGO", limit: 2, null: false
  end

  create_table "seguimiento", primary_key: "SEG_CODIGO", force: :cascade do |t|
    t.integer  "PAD_CODIGO",    limit: 4
    t.string   "SEG_CONTACTO",  limit: 200
    t.string   "SEG_TELEFONO",  limit: 20
    t.string   "SEG_MAIL",      limit: 150
    t.datetime "SEG_REGISTRO"
    t.text     "SEG_NOVEDADES", limit: 4294967295
    t.integer  "USU_CODIGO",    limit: 4
  end

  create_table "servicio", primary_key: "SVO_CODIGO", force: :cascade do |t|
    t.string  "SVO_NOMBRE", limit: 45
    t.integer "SVO_ESTADO", limit: 4
  end

  create_table "sitcontable", primary_key: "SIC_CODIGO", force: :cascade do |t|
    t.string  "SIC_DENOMINACION", limit: 250
    t.integer "SIC_ESTADO",       limit: 4,   default: 1, null: false
  end

  create_table "sms", primary_key: "SMS_CODIGO", force: :cascade do |t|
    t.integer  "CLI_CODIGO",    limit: 4,                                   null: false
    t.datetime "SMS_REGISTRO",                                              null: false
    t.datetime "SMS_FCORTE",                                                null: false
    t.string   "SMS_TIPO",      limit: 50,                                  null: false
    t.string   "SMS_MENSAJE",   limit: 170,                                 null: false
    t.string   "SMS_SID",       limit: 200,                                 null: false
    t.string   "SMS_TCELULAR",  limit: 100
    t.decimal  "SMS_VALOR",                        precision: 38, scale: 2, null: false
    t.text     "SMS_RESPUESTA", limit: 4294967295
    t.integer  "USU_CODIGO",    limit: 4
    t.integer  "ABV_CODIGO",    limit: 4,                                   null: false
  end

  add_index "sms", ["CLI_CODIGO"], name: "CLIENTESMS", using: :btree

  create_table "solicitudes", primary_key: "SOL_CODIGO", force: :cascade do |t|
    t.string   "SOL_NUMERO",           limit: 20
    t.integer  "SOL_ROUTER",           limit: 4,                           default: 0
    t.datetime "SOL_FECHA"
    t.datetime "SOL_FECHAVIGENCIA"
    t.string   "SOL_OBSERVACION",      limit: 100
    t.decimal  "SOL_PAGOMENSUAL",                  precision: 8, scale: 4
    t.decimal  "SOL_PAGOINSTALACION",              precision: 8, scale: 4
    t.integer  "CIU_CODIGO",           limit: 4
    t.string   "SOL_DIRECCIONINSTALA", limit: 200
    t.integer  "ITE_SERVICIO",         limit: 4
    t.integer  "ITE_INSTALACION",      limit: 4
    t.integer  "TES_CODIGO",           limit: 4
    t.integer  "SOL_ESTADO",           limit: 4,                           default: 1, null: false
    t.integer  "TSE_CODIGO",           limit: 4
    t.integer  "CLI_CODIGO",           limit: 4
    t.integer  "CTR_CODIGO",           limit: 4
  end

  add_index "solicitudes", ["TSE_CODIGO"], name: "tipoplan_pla_codigofk_idx", using: :btree

  create_table "subtipos", primary_key: "SUB_CODIGO", force: :cascade do |t|
    t.string  "SUB_VALOR",  limit: 100
    t.integer "TIP_CODIGO", limit: 4
    t.string  "SUB_GRUPO",  limit: 50
    t.integer "SUB_ORDEN",  limit: 4
    t.integer "SUB_ESTADO", limit: 4,   default: 1
  end

  create_table "sucursales", primary_key: "SUC_CODIGO", force: :cascade do |t|
    t.integer "CLI_CODIGO",     limit: 4,               null: false
    t.string  "SUC_DIRECCION",  limit: 250,             null: false
    t.string  "SUC_EMAIL",      limit: 250,             null: false
    t.string  "SUC_REFERENCIA", limit: 250,             null: false
    t.integer "TEA_CODIGO",     limit: 4,               null: false
    t.integer "CIU_CODIGO",     limit: 4,               null: false
    t.string  "ZON_CODIGO",     limit: 4
    t.integer "SUC_ESTADO",     limit: 4,   default: 1
  end

  add_index "sucursales", ["CIU_CODIGO"], name: "CIU_CODIGO", using: :btree
  add_index "sucursales", ["CLI_CODIGO"], name: "CLI_CODIGO", using: :btree
  add_index "sucursales", ["TEA_CODIGO"], name: "TEA_CODIGO", using: :btree
  add_index "sucursales", ["ZON_CODIGO"], name: "ZON_CODIGO", using: :btree

  create_table "sustentos", primary_key: "SUS_CODIGO", force: :cascade do |t|
    t.string  "SUS_TIPO",   limit: 255,             null: false
    t.integer "SUS_ESTADO", limit: 4,   default: 1, null: false
  end

  create_table "sustentos_comprobantes", id: false, force: :cascade do |t|
    t.string "SUS_CODIGO", limit: 2, null: false
    t.string "TIC_CODIGO", limit: 2, null: false
  end

  create_table "tar_compras", primary_key: "TAC_CODIGO", force: :cascade do |t|
    t.integer "COM_CODIGO", limit: 4
    t.integer "CMO_CODIGO", limit: 4
    t.decimal "TAC_VALOR",            precision: 38, scale: 4
    t.string  "FPS_CODIGO", limit: 2,                          default: "00", null: false
  end

  add_index "tar_compras", ["COM_CODIGO"], name: "IX_COM_CODIGO", using: :btree

  create_table "tar_ventas", primary_key: "TAV_CODIGO", force: :cascade do |t|
    t.integer "VEN_CODIGO", limit: 4
    t.integer "CMO_CODIGO", limit: 4
    t.decimal "TAV_VALOR",            precision: 38, scale: 4
  end

  add_index "tar_ventas", ["VEN_CODIGO"], name: "FK_TAR_VENTAS_VENTAS", using: :btree
  add_index "tar_ventas", ["VEN_CODIGO"], name: "IX_VEN_CODIGO", using: :btree

  create_table "tarjetas", primary_key: "TAR_CODIGO", force: :cascade do |t|
    t.string  "TAR_NOMBRE",          limit: 200
    t.string  "TAR_BANCO",           limit: 50
    t.string  "TAR_ESTABLECIMIENTO", limit: 50
    t.integer "CBA_CODIGO",          limit: 4
    t.integer "TAR_RENTA",           limit: 4
    t.integer "TAR_RENTAPC",         limit: 4
    t.integer "TAR_IVA",             limit: 4
    t.integer "TAR_IVAPC",           limit: 4
    t.integer "TAR_CONSUMO",         limit: 4
    t.integer "TAR_ESTADO",          limit: 4,   default: 1
  end

  create_table "telefonosa", primary_key: "TEA_CODIGO", force: :cascade do |t|
    t.text    "TEA_DESCRIPCION", limit: 65535,             null: false
    t.string  "TEA_NUMERO",      limit: 20
    t.text    "TEA_TIPO",        limit: 65535
    t.integer "TEA_ESTADO",      limit: 4,     default: 1, null: false
    t.integer "ASO_CODIGO",      limit: 4,                 null: false
    t.string  "ASO_TIPO",        limit: 20,                null: false
  end

  create_table "telefonosp", id: false, force: :cascade do |t|
    t.integer "TEP_CODIGO",      limit: 4,     default: 0, null: false
    t.text    "TEP_DESCRIPCION", limit: 65535,             null: false
    t.string  "TEP_NUMERO",      limit: 20
    t.integer "TEP_TIPO",        limit: 4,     default: 1
    t.integer "TEP_ESTADO",      limit: 4,     default: 1, null: false
    t.integer "USU_CODIGO",      limit: 4,                 null: false
  end

  create_table "terminado", primary_key: "TER_CODIGO", force: :cascade do |t|
    t.string  "TER_DESCRIPCION", limit: 45
    t.integer "TER_ESTADO",      limit: 4
  end

  create_table "tipo_comprobante", primary_key: "TIC_CODIGO", force: :cascade do |t|
    t.string  "TIC_COMPROBANTE", limit: 255,             null: false
    t.integer "TIC_ESTADO",      limit: 4,   default: 1, null: false
  end

  create_table "tipo_descuento", primary_key: "TDE_CODIGO", force: :cascade do |t|
    t.string  "TDE_DESCRIPCION", limit: 45, default: "", null: false
    t.integer "TDE_ESTADO",      limit: 4,  default: 1,  null: false
  end

  create_table "tipo_estados", primary_key: "TES_CODIGO", force: :cascade do |t|
    t.string  "TES_DESCRIPCION",     limit: 45,                          null: false
    t.decimal "TES_COSTOACTIVACION",            precision: 38, scale: 4, null: false
    t.integer "TES_ACTIVADO",        limit: 4,                           null: false
  end

  create_table "tipo_evento", primary_key: "TEV_CODIGO", force: :cascade do |t|
    t.string  "TEV_DESCRIPCION", limit: 250, null: false
    t.integer "TEV_ESTADO",      limit: 4,   null: false
  end

  create_table "tipo_identificacion", primary_key: "IDE_CODIGO", force: :cascade do |t|
    t.string "IDE_TRANSACCION",    limit: 50, null: false
    t.string "IDE_IDENTIFICACION", limit: 50, null: false
    t.string "IDE_TIPOIDICE",      limit: 1,  null: false
  end

  create_table "tipo_procesamiento", primary_key: "TPR_CODIGO", force: :cascade do |t|
    t.string  "TPR_DESCRIPCION", limit: 50
    t.integer "TPR_ESTADO",      limit: 4
  end

  create_table "tipo_servicios", primary_key: "TSE_CODIGO", force: :cascade do |t|
    t.string  "TSE_DESCRIPCION", limit: 45
    t.integer "TSE_AFECTA",      limit: 4,   default: 0, null: false
    t.integer "TSE_CONTRATO",    limit: 4,   default: 0, null: false
    t.integer "TSE_ESTADO",      limit: 4
    t.string  "TSE_SOLICITUD",   limit: 100
    t.integer "TES_CODIGO",      limit: 4,   default: 0, null: false
  end

  create_table "tipoagente", primary_key: "TAG_CODIGO", force: :cascade do |t|
    t.string  "TAG_DESCRIPCION", limit: 200, null: false
    t.integer "TAG_ESTADO",      limit: 4,   null: false
  end

  create_table "tipocliente", primary_key: "TCL_CODIGO", force: :cascade do |t|
    t.string  "TCL_DESCRIPCION", limit: 50,                                        null: false
    t.integer "TCL_ESTADO",      limit: 4,                                         null: false
    t.decimal "TCL_PORCENTAJE",             precision: 38, scale: 2, default: 0.0, null: false
  end

  create_table "tipodepreciacion", primary_key: "TDE_CODIGO", force: :cascade do |t|
    t.string  "TDE_DESCRIPCION", limit: 150
    t.decimal "TDE_PORCENTAJE",              precision: 38, scale: 2
    t.integer "TDE_VIDAUTIL",    limit: 4
  end

  create_table "tipoestadocivil", id: false, force: :cascade do |t|
    t.integer "TCL_CODIGO", limit: 4,  default: 0, null: false
    t.string  "TCL_NOMBRE", limit: 20,             null: false
    t.integer "TCL_ESTADO", limit: 4,  default: 1, null: false
  end

  create_table "tipoidentificacionxml", primary_key: "TIX_CODIGO", force: :cascade do |t|
    t.string "TIX_NOMBRE", limit: 100, null: false
    t.string "IDE_CODIGO", limit: 2,   null: false
  end

  create_table "tipoproveedor", primary_key: "TPR_CODIGO", force: :cascade do |t|
    t.string "TPR_DESCRIPCION", limit: 250
  end

  create_table "tipos", primary_key: "TIP_CODIGO", force: :cascade do |t|
    t.string  "TIP_DESCRIPCION", limit: 250, null: false
    t.integer "TIP_ESTADO",      limit: 4,   null: false
  end

  create_table "tipos_cuadrecaja", primary_key: "TCC_CODIGO", force: :cascade do |t|
    t.string  "TCC_DESCRIPCION", limit: 50,             null: false
    t.integer "TCC_ESTADO",      limit: 4,  default: 1, null: false
  end

  create_table "titulos", id: false, force: :cascade do |t|
    t.integer "TIT_CODIGO",      limit: 4,   default: 0, null: false
    t.string  "TIT_DESCRIPCION", limit: 250,             null: false
    t.integer "TIT_ESTADO",      limit: 4,   default: 1, null: false
  end

  create_table "trans_avi_kit_items", force: :cascade do |t|
    t.integer  "transformacion_avicola_id", limit: 4,                          null: false
    t.integer  "item_id",                   limit: 4,                          null: false
    t.decimal  "cantidad",                            precision: 38, scale: 8, null: false
    t.decimal  "costo",                               precision: 38, scale: 8, null: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "trans_avi_kit_items", ["item_id"], name: "fk_rails_af9c30e20c", using: :btree
  add_index "trans_avi_kit_items", ["transformacion_avicola_id"], name: "index_trans_avi_kit_items_on_transformacion_avicola_id", using: :btree

  create_table "transacciones", primary_key: "TRA_CODIGO", force: :cascade do |t|
    t.integer "ASI_NUMERO",     limit: 4,                                         null: false
    t.integer "PLA_CODIGO",     limit: 4,                                         null: false
    t.integer "LOC_CODIGO",     limit: 4,                            default: -1
    t.string  "TRA_REFERENCIA", limit: 150,                                       null: false
    t.decimal "TRA_DEBE",                   precision: 38, scale: 4,              null: false
    t.decimal "TRA_HABER",                  precision: 38, scale: 4,              null: false
  end

  add_index "transacciones", ["ASI_NUMERO"], name: "FK_TRANSACCIONES_ASIENTOS", using: :btree
  add_index "transacciones", ["PLA_CODIGO"], name: "PLAN", using: :btree
  add_index "transacciones", ["PLA_CODIGO"], name: "PLANC", using: :btree

  create_table "transferencias", primary_key: "TRF_CODIGO", force: :cascade do |t|
    t.string   "TRF_NUMERO",      limit: 50
    t.datetime "TRF_FECHA"
    t.text     "TRF_DESCRIPCION", limit: 4294967295,             null: false
    t.integer  "LOC_ORIGEN",      limit: 4,                      null: false
    t.integer  "LOC_DESTINO",     limit: 4,                      null: false
    t.integer  "TRF_PROGRESO",    limit: 4,          default: 0, null: false
    t.integer  "TRF_ESTADO",      limit: 4,          default: 1, null: false
  end

  add_index "transferencias", ["LOC_DESTINO"], name: "LOC_DESTINO", using: :btree
  add_index "transferencias", ["LOC_ORIGEN"], name: "LOC_ORIGEN", using: :btree

  create_table "transformacion_avicolas", force: :cascade do |t|
    t.string   "numero_de_transformacion", limit: 255
    t.text     "observaciones",            limit: 65535
    t.boolean  "estado",                                 default: false, null: false
    t.integer  "item_id",                  limit: 4,                     null: false
    t.integer  "cantidad",                 limit: 4,                     null: false
    t.integer  "codigo_salida",            limit: 4
    t.integer  "codigo_entrada",           limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "transformacion_avicolas", ["item_id"], name: "index_transformacion_avicolas_on_item_id", using: :btree
  add_index "transformacion_avicolas", ["numero_de_transformacion"], name: "index_transformacion_avicolas_on_numero_de_transformacion", unique: true, using: :btree

  create_table "trf_detalle", primary_key: "TRD_CODIGO", force: :cascade do |t|
    t.integer "TRF_CODIGO",   limit: 4,                                      null: false
    t.integer "ITE_CODIGO",   limit: 4,                                      null: false
    t.decimal "TRD_CANTIDAD",           precision: 38, scale: 4,             null: false
    t.integer "TRD_PROGRESO", limit: 4,                          default: 0, null: false
    t.decimal "TRD_PVD",                precision: 38, scale: 2,             null: false
    t.decimal "TRD_PVP",                precision: 38, scale: 2,             null: false
    t.integer "TRD_ESTADO",   limit: 4,                          default: 1, null: false
  end

  add_index "trf_detalle", ["ITE_CODIGO"], name: "IX_ITEMS", using: :btree
  add_index "trf_detalle", ["TRF_CODIGO"], name: "IX_TRANSFERENCIAS", using: :btree

  create_table "tributario", primary_key: "TRI_CODIGO", force: :cascade do |t|
    t.string "TRI_DESCRIPCION", limit: 250, null: false
  end

  create_table "trs_cabecera", primary_key: "TRS_CODIGO", force: :cascade do |t|
    t.string   "TRS_NUMERO",        limit: 20,                           null: false
    t.datetime "TRS_FECHA",                                              null: false
    t.string   "TRS_OBSERVACIONES", limit: 200
    t.integer  "CMB_CODIGO",        limit: 4,                            null: false
    t.decimal  "TRS_RESULTADODES",              precision: 38, scale: 5, null: false
    t.decimal  "TRS_RESULTADOREAL",             precision: 38, scale: 5, null: false
    t.decimal  "TRS_MERMA",                     precision: 38, scale: 5, null: false
    t.integer  "TRS_ESTADO",        limit: 4,                            null: false
    t.integer  "LOC_CODIGO",        limit: 4
  end

  create_table "trs_detalle", primary_key: "TRD_CODIGO", force: :cascade do |t|
    t.decimal "TRD_CANTIDAD",             precision: 38, scale: 5, null: false
    t.integer "TRS_CODIGO",     limit: 4,                          null: false
    t.integer "CMB_CODIGO",     limit: 4,                          null: false
    t.decimal "CMB_PROPORCION",           precision: 38, scale: 5, null: false
  end

  add_index "trs_detalle", ["TRS_CODIGO"], name: "TRSDETALLEFK", using: :btree

  create_table "unidades", primary_key: "UNI_CODIGO", force: :cascade do |t|
    t.string  "UNI_NOMBRE", limit: 100,             null: false
    t.string  "UNI_SIGLAS", limit: 10,              null: false
    t.integer "UNI_GRUPO",  limit: 4,   default: 1, null: false
    t.integer "UNI_ESTADO", limit: 4,   default: 1, null: false
  end

  create_table "usomaster", id: false, force: :cascade do |t|
    t.string   "MAS_CODIGO",   limit: 45, null: false
    t.datetime "UMA_REGISTRO"
  end

  create_table "usuarios", id: false, force: :cascade do |t|
    t.integer  "USU_CODIGO",             limit: 4,   default: 0,   null: false
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

  create_table "usuarios_locales", id: false, force: :cascade do |t|
    t.integer "ULO_CODIGO", limit: 4,  default: 0,     null: false
    t.integer "USU_CODIGO", limit: 4,                  null: false
    t.string  "ULO_TIPO",   limit: 50, default: "USU"
    t.integer "LEM_CODIGO", limit: 4
  end

  create_table "usumenus", force: :cascade do |t|
    t.integer  "menu_id",    limit: 4
    t.integer  "usuario_id", limit: 4
    t.integer  "orden",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "usumenus", ["menu_id"], name: "fk_rails_37b5193390", using: :btree

  create_table "vacaciones", primary_key: "VAC_CODIGO", force: :cascade do |t|
    t.integer  "USU_CODIGO",     limit: 4,                          null: false
    t.datetime "VAC_FECHA",                                         null: false
    t.datetime "VAC_INIPERIODO",                                    null: false
    t.datetime "VAC_FINPERIODO",                                    null: false
    t.decimal  "VAC_BASE",                 precision: 38, scale: 4, null: false
    t.decimal  "VAC_VALOR",                precision: 38, scale: 4, null: false
    t.integer  "VAC_FPAGO",      limit: 4,                          null: false
    t.integer  "VAC_ESTADO",     limit: 4,                          null: false
  end

  create_table "vehiculos", primary_key: "VEH_CODIGO", force: :cascade do |t|
    t.integer  "APL_CODIGO",        limit: 4
    t.datetime "VEH_FECHA"
    t.string   "VEH_CLASE",         limit: 100
    t.string   "VEH_TIPO",          limit: 100
    t.integer  "VEH_ANIO",          limit: 4
    t.string   "VEH_MODELO",        limit: 100
    t.string   "VEH_PLACA",         limit: 8
    t.string   "VEH_COLOR",         limit: 50
    t.string   "VEH_CHASIS",        limit: 100, null: false
    t.string   "VEH_MOTOR",         limit: 100, null: false
    t.string   "VEH_IMAGEN",        limit: 500, null: false
    t.integer  "LOC_CODIGO",        limit: 4,   null: false
    t.integer  "VEH_ANIOMATRICULA", limit: 4,   null: false
    t.string   "VEH_CILINDRAJE",    limit: 10,  null: false
    t.string   "VEH_NOMBREMAT",     limit: 10,  null: false
  end

  add_index "vehiculos", ["VEH_PLACA"], name: "IX_VEHICULOS", unique: true, using: :btree

  create_table "vendedores", primary_key: "VDR_CODIGO", force: :cascade do |t|
    t.integer "USU_CODIGO",   limit: 4,                                        null: false
    t.decimal "VDR_COMISION",             precision: 38, scale: 4,             null: false
    t.string  "VDR_ZONA",     limit: 200,                                      null: false
    t.string  "VDR_SIGLAS",   limit: 10,                                       null: false
    t.integer "VDR_ESTADO",   limit: 4,                            default: 1, null: false
  end

  create_table "ventas", primary_key: "VEN_CODIGO", force: :cascade do |t|
    t.string   "VEN_TIPODOC",         limit: 20,                                                null: false
    t.string   "VEN_NUMERO",          limit: 9,                                                 null: false
    t.string   "VEN_AUTORIZACION",    limit: 50,                                                null: false
    t.string   "VEN_ESTABLECIMIENTO", limit: 3,                                                 null: false
    t.string   "VEN_PTOEMISION",      limit: 3,                                                 null: false
    t.datetime "VEN_FECHA"
    t.string   "VEN_GUIA",            limit: 50
    t.decimal  "VEN_SUBTOTAL12",                         precision: 38, scale: 4,               null: false
    t.decimal  "VEN_SUBTOTAL0",                          precision: 38, scale: 4,               null: false
    t.decimal  "VEN_SUBTOTALNOIVA",                      precision: 38, scale: 4, default: 0.0, null: false
    t.decimal  "VEN_DESCUENTO",                          precision: 38, scale: 4
    t.decimal  "VEN_SUBTOTAL",                           precision: 38, scale: 4,               null: false
    t.decimal  "VEN_IVA",                                precision: 38, scale: 4
    t.decimal  "VEN_ICE",                                precision: 38, scale: 4, default: 0.0, null: false
    t.decimal  "VEN_TOTAL",                              precision: 38, scale: 4,               null: false
    t.integer  "VEN_FPAGO",           limit: 4
    t.integer  "ASI_NUMERO",          limit: 4
    t.integer  "CLI_CODIGO",          limit: 4,                                                 null: false
    t.integer  "USU_CODIGO",          limit: 4,                                                 null: false
    t.integer  "EMP_CODIGO",          limit: 4,                                                 null: false
    t.integer  "LOC_CODIGO",          limit: 4,                                                 null: false
    t.integer  "PTO_CODIGO",          limit: 4
    t.integer  "VEN_IMPRESO",         limit: 4,                                                 null: false
    t.text     "VEN_OBSERVACIONES",   limit: 4294967295
    t.integer  "VDR_CODIGO",          limit: 4
    t.decimal  "VEN_SERVICIOS",                          precision: 38, scale: 2, default: 0.0, null: false
    t.integer  "SUC_CODIGO",          limit: 4
    t.integer  "VEN_ESTADO",          limit: 4,                                                 null: false
    t.integer  "VEN_COSTEONC",        limit: 4,                                   default: 0,   null: false
    t.decimal  "VEN_DESCUENTOG",                         precision: 38, scale: 2, default: 0.0, null: false
    t.datetime "VEN_FECHAN",                                                                    null: false
  end

  add_index "ventas", ["CLI_CODIGO"], name: "FK_VENTAS_CLIENTES", using: :btree
  add_index "ventas", ["PTO_CODIGO"], name: "FK_VENTAS_PTO_VENTA", using: :btree
  add_index "ventas", ["SUC_CODIGO"], name: "SUC_CODIGO", using: :btree
  add_index "ventas", ["VEN_ESTADO"], name: "FK_VENTAS_ESTADOS", using: :btree
  add_index "ventas", ["VEN_TIPODOC", "VEN_NUMERO", "VEN_ESTABLECIMIENTO", "VEN_PTOEMISION", "CLI_CODIGO", "VEN_AUTORIZACION"], name: "IX_VENTAS", unique: true, using: :btree

  create_table "ventas_detalle", primary_key: "VED_CODIGO", force: :cascade do |t|
    t.integer "VEN_CODIGO",      limit: 4,                                        null: false
    t.integer "ITE_CODIGO",      limit: 4,                                        null: false
    t.string  "ITE_DESCRIPCION", limit: 500
    t.decimal "VED_CANTIDAD",                precision: 38, scale: 4,             null: false
    t.decimal "VED_DESCUENTO",               precision: 38, scale: 4
    t.decimal "VED_PUNITARIO",               precision: 38, scale: 4,             null: false
    t.decimal "VED_IMPUESTO",                precision: 38, scale: 4
    t.decimal "VED_VALOR",                   precision: 38, scale: 4,             null: false
    t.integer "LOC_CODIGO",      limit: 4,                                        null: false
    t.integer "VED_ICE",         limit: 4,                            default: 0, null: false
  end

  add_index "ventas_detalle", ["ITE_CODIGO"], name: "FK_VENTAS_DETALLE_ITEMS", using: :btree
  add_index "ventas_detalle", ["VEN_CODIGO"], name: "FK_VENTAS_DETALLE_VENTAS", using: :btree

  create_table "ventasf", primary_key: "VEF_CODIGO", force: :cascade do |t|
    t.decimal  "VEF_VALOR",                  precision: 18, scale: 3, null: false
    t.datetime "VEF_FECHA",                                           null: false
    t.string   "VEF_DESCRIPCION", limit: 20,                          null: false
    t.decimal  "VEF_IMPRESION",              precision: 18, scale: 3, null: false
    t.decimal  "VEF_COPIAS",                 precision: 18, scale: 3, null: false
    t.decimal  "VEF_ANILLADO",               precision: 18, scale: 3, null: false
    t.decimal  "VEF_SERVICIOS",              precision: 18, scale: 3, null: false
  end

  create_table "xml_lotes", primary_key: "XML_CLAVE", force: :cascade do |t|
    t.string "XML_NUMERO",          limit: 9, null: false
    t.string "XML_ESTABLECIMIENTO", limit: 3, null: false
    t.string "XML_PTOEMISION",      limit: 3, null: false
  end

  create_table "zonase", id: false, force: :cascade do |t|
    t.string  "ZON_CODIGO", limit: 4,               null: false
    t.string  "ZON_NOMBRE", limit: 250,             null: false
    t.integer "ZON_ESTADO", limit: 4,   default: 1, null: false
  end

  add_foreign_key "archivoskitbases", "kitbases", column: "kitbase_id"
  add_foreign_key "detalle_pedidos", "complemento", column: "CPL_CODIGO", primary_key: "CPL_CODIGO", name: "COMPLEMENTOFK", on_update: :cascade
  add_foreign_key "detalle_pedidos", "estado_pedidos", column: "ESP_CODIGO", primary_key: "ESP_CODIGO", name: "ESTADOPEDIDOFK"
  add_foreign_key "detalle_pedidos", "items", column: "ITE_CODIGO", primary_key: "ITE_CODIGO", name: "ITEMSFK", on_update: :cascade, on_delete: :cascade
  add_foreign_key "detalle_pedidos", "pedidos", column: "PED_CODIGO", primary_key: "PED_CODIGO", name: "DETALLEPEDIDOFK", on_update: :cascade, on_delete: :cascade
  add_foreign_key "detalle_pedidos", "tipo_procesamiento", column: "TPR_CODIGO", primary_key: "TPR_CODIGO", name: "TIPOPROCESAMIENTOFK", on_update: :cascade
  add_foreign_key "detalle_pedidos", "unidades", column: "UNI_CODIGO", primary_key: "UNI_CODIGO", name: "detalle_pedidos_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "detalle_pedidos", "ventas", column: "VEN_CODIGO", primary_key: "VEN_CODIGO", name: "VENTAPEDIDOSDET", on_update: :cascade, on_delete: :nullify
  add_foreign_key "detalle_trans_avicolas", "items", column: "kit_id", primary_key: "ITE_CODIGO"
  add_foreign_key "detalle_trans_avicolas", "transformacion_avicolas"
  add_foreign_key "ditemkitbases", "items", primary_key: "ITE_CODIGO"
  add_foreign_key "ditemkitbases", "kitbases", column: "kitbase_id"
  add_foreign_key "dmanokitbases", "kitbases", column: "kitbase_id"
  add_foreign_key "emails", "clientes", column: "CLI_CODIGO", primary_key: "CLI_CODIGO", name: "emails_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hojaitems", "items", primary_key: "ITE_CODIGO"
  add_foreign_key "hojaitems", "ordenproducintels"
  add_foreign_key "hojamanoobras", "ordenproducintels", on_update: :cascade, on_delete: :cascade
  add_foreign_key "llamadas", "clientes", column: "CLI_CODIGO", primary_key: "CLI_CODIGO", name: "llamadas_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "mov_detalle", "mov_cabecera", column: "MCA_CODIGO", primary_key: "MCA_CODIGO", name: "mov_detalle_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ordenproducintels", "clientes", primary_key: "CLI_CODIGO"
  add_foreign_key "ordenproducintels", "profinteldetalles"
  add_foreign_key "parentescos", "clientes", column: "CLI_CODIGO", primary_key: "CLI_CODIGO", name: "parentesco_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "parentescos", "clientes", column: "CLI_CODIGOP", primary_key: "CLI_CODIGO", name: "parentesco_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "pedidos", "clientes", column: "CLI_CODIGO", primary_key: "CLI_CODIGO", name: "CLIENTESFK", on_update: :cascade, on_delete: :cascade
  add_foreign_key "pedidos", "estado_pedidos", column: "ESP_CODIGO", primary_key: "ESP_CODIGO", name: "ESTADOPEDIDO"
  add_foreign_key "pedidos", "ventas", column: "VEN_CODIGO", primary_key: "VEN_CODIGO", name: "VENTAS", on_update: :cascade, on_delete: :nullify
  add_foreign_key "profinteldetalles", "kitbases", column: "kitbase_id"
  add_foreign_key "profinteldetalles", "proformaintels"
  add_foreign_key "proformaintels", "clientes", column: "responsable_id", primary_key: "CLI_CODIGO"
  add_foreign_key "proformaintels", "clientes", primary_key: "CLI_CODIGO"
  add_foreign_key "recepcion_bodegadetalles", "items", primary_key: "ITE_CODIGO", name: "recepciondetbodega_itemfk"
  add_foreign_key "recepcion_bodegadetalles", "mov_cabecera", column: "movcabecera_id", primary_key: "MCA_CODIGO", name: "recepciondetbodega_movimientofk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "recepcion_bodegadetalles", "recepcion_bodegas", column: "recepcionbodegas_id", name: "recepciondetbodega_cabecerafk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "retazosproduccions", "hojaitems", on_update: :cascade, on_delete: :cascade
  add_foreign_key "retazosproduccions", "items", column: "itemnuevo_id", primary_key: "ITE_CODIGO"
  add_foreign_key "retazosproduccions", "items", column: "itemoriginal_id", primary_key: "ITE_CODIGO"
  add_foreign_key "retazosproduccions", "ordenproducintels", column: "orden_id"
  add_foreign_key "sms", "clientes", column: "CLI_CODIGO", primary_key: "CLI_CODIGO", name: "sms_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "trans_avi_kit_items", "items", primary_key: "ITE_CODIGO"
  add_foreign_key "trans_avi_kit_items", "transformacion_avicolas"
  add_foreign_key "transformacion_avicolas", "items", primary_key: "ITE_CODIGO"
  add_foreign_key "usumenus", "menu", primary_key: "MEN_CODIGO"
end
