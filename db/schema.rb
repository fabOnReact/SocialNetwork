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

ActiveRecord::Schema.define(version: 20170221150731) do

  create_table "ads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.text     "title",       limit: 65535
    t.text     "description", limit: 65535
    t.integer  "budget"
    t.integer  "days"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["project_id"], name: "index_ads_on_project_id", using: :btree
  end

  create_table "developers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "experience"
    t.string   "interests"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "jobtitle"
    t.string   "website_url"
    t.string   "skill_list"
    t.index ["user_id"], name: "index_developers_on_user_id", using: :btree
  end

  create_table "developers_projects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "developer_id"
    t.integer "project_id"
    t.index ["developer_id"], name: "index_developers_projects_on_developer_id", using: :btree
    t.index ["project_id"], name: "index_developers_projects_on_project_id", using: :btree
  end

  create_table "developers_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "developer_id"
    t.integer "skill_id"
    t.index ["developer_id"], name: "index_developers_skills_on_developer_id", using: :btree
    t.index ["skill_id"], name: "index_developers_skills_on_skill_id", using: :btree
  end

  create_table "hosts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.text    "description",  limit: 65535
    t.string  "location"
    t.integer "singleroom"
    t.integer "sharedroom"
    t.integer "surfspot"
    t.integer "barbecue"
    t.integer "villa"
    t.integer "swimmingpool"
    t.integer "skiresort"
    t.index ["user_id"], name: "index_hosts_on_user_id", using: :btree
  end

  create_table "hosts_projects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "host_id"
    t.integer "project_id"
    t.index ["host_id"], name: "index_hosts_projects_on_host_id", using: :btree
    t.index ["project_id"], name: "index_hosts_projects_on_project_id", using: :btree
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "host_id"
    t.text     "description",  limit: 65535
    t.string   "location"
    t.boolean  "singleroom"
    t.boolean  "sharedroom"
    t.boolean  "surfspot"
    t.boolean  "barbecue"
    t.boolean  "villa"
    t.boolean  "swimmingpool"
    t.boolean  "skiresort"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "country"
    t.string   "state"
    t.index ["host_id"], name: "index_locations_on_host_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "percentage_completion"
    t.integer  "budget"
    t.integer  "nemployees"
    t.integer  "ninvestors"
    t.boolean  "hiring"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_roles_users_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "name",                       collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "project_id"
    t.text     "description", limit: 65535
    t.boolean  "completed"
    t.string   "skill"
    t.integer  "days"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["project_id"], name: "index_tasks_on_project_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "country"
    t.string   "location"
    t.integer  "roles_id"
    t.string   "image"
    t.boolean  "verified"
    t.integer  "location_id"
    t.text     "gender",                 limit: 65535
    t.integer  "timezone"
    t.text     "description",            limit: 65535
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["roles_id"], name: "index_users_on_roles_id", using: :btree
  end

end
