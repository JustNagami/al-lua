local var_0_0 = require("protobuf")
local var_0_1 = require("common_pb")

module("p30_pb")

local var_0_2 = {}

SC_30001 = var_0_0.Descriptor()
var_0_2.SC_30001_UNREAD_NUMBER_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_30001_TOTAL_NUMBER_FIELD = var_0_0.FieldDescriptor()
CS_30002 = var_0_0.Descriptor()
var_0_2.CS_30002_TYPE_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_30002_SPLIT_ID_FIELD = var_0_0.FieldDescriptor()
SC_30003 = var_0_0.Descriptor()
var_0_2.SC_30003_MAIL_LIST_FIELD = var_0_0.FieldDescriptor()
CS_30004 = var_0_0.Descriptor()
var_0_2.CS_30004_ID_FIELD = var_0_0.FieldDescriptor()
SC_30005 = var_0_0.Descriptor()
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD = var_0_0.FieldDescriptor()
CS_30006 = var_0_0.Descriptor()
var_0_2.CS_30006_ID_FIELD = var_0_0.FieldDescriptor()
SC_30007 = var_0_0.Descriptor()
var_0_2.SC_30007_ID_LIST_FIELD = var_0_0.FieldDescriptor()
CS_30008 = var_0_0.Descriptor()
var_0_2.CS_30008_ID_FIELD = var_0_0.FieldDescriptor()
SC_30009 = var_0_0.Descriptor()
var_0_2.SC_30009_DETAIL_INFO_FIELD = var_0_0.FieldDescriptor()
CS_30010 = var_0_0.Descriptor()
var_0_2.CS_30010_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_30010_FLAG_FIELD = var_0_0.FieldDescriptor()
SC_30011 = var_0_0.Descriptor()
var_0_2.SC_30011_RESULT_FIELD = var_0_0.FieldDescriptor()
MAIL_SIGLE = var_0_0.Descriptor()
var_0_2.MAIL_SIGLE_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_SIGLE_DATE_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_SIGLE_TITLE_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD = var_0_0.FieldDescriptor()
MAIL_DETAIL = var_0_0.Descriptor()
var_0_2.MAIL_DETAIL_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_DETAIL_CONTENT_FIELD = var_0_0.FieldDescriptor()
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD = var_0_0.FieldDescriptor()
ATTACHMENT = var_0_0.Descriptor()
var_0_2.ATTACHMENT_TYPE_FIELD = var_0_0.FieldDescriptor()
var_0_2.ATTACHMENT_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.ATTACHMENT_NUMBER_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.name = "unread_number"
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.full_name = "p30.sc_30001.unread_number"
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.number = 1
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.index = 0
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.label = 2
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.has_default_value = false
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.default_value = 0
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.type = 13
var_0_2.SC_30001_UNREAD_NUMBER_FIELD.cpp_type = 3
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.name = "total_number"
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.full_name = "p30.sc_30001.total_number"
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.number = 3
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.index = 1
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.label = 2
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.has_default_value = false
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.default_value = 0
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.type = 13
var_0_2.SC_30001_TOTAL_NUMBER_FIELD.cpp_type = 3
SC_30001.name = "sc_30001"
SC_30001.full_name = "p30.sc_30001"
SC_30001.nested_types = {}
SC_30001.enum_types = {}
SC_30001.fields = {
	var_0_2.SC_30001_UNREAD_NUMBER_FIELD,
	var_0_2.SC_30001_TOTAL_NUMBER_FIELD
}
SC_30001.is_extendable = false
SC_30001.extensions = {}
var_0_2.CS_30002_TYPE_FIELD.name = "type"
var_0_2.CS_30002_TYPE_FIELD.full_name = "p30.cs_30002.type"
var_0_2.CS_30002_TYPE_FIELD.number = 1
var_0_2.CS_30002_TYPE_FIELD.index = 0
var_0_2.CS_30002_TYPE_FIELD.label = 2
var_0_2.CS_30002_TYPE_FIELD.has_default_value = false
var_0_2.CS_30002_TYPE_FIELD.default_value = 0
var_0_2.CS_30002_TYPE_FIELD.type = 13
var_0_2.CS_30002_TYPE_FIELD.cpp_type = 3
var_0_2.CS_30002_SPLIT_ID_FIELD.name = "split_id"
var_0_2.CS_30002_SPLIT_ID_FIELD.full_name = "p30.cs_30002.split_id"
var_0_2.CS_30002_SPLIT_ID_FIELD.number = 2
var_0_2.CS_30002_SPLIT_ID_FIELD.index = 1
var_0_2.CS_30002_SPLIT_ID_FIELD.label = 1
var_0_2.CS_30002_SPLIT_ID_FIELD.has_default_value = false
var_0_2.CS_30002_SPLIT_ID_FIELD.default_value = 0
var_0_2.CS_30002_SPLIT_ID_FIELD.type = 13
var_0_2.CS_30002_SPLIT_ID_FIELD.cpp_type = 3
CS_30002.name = "cs_30002"
CS_30002.full_name = "p30.cs_30002"
CS_30002.nested_types = {}
CS_30002.enum_types = {}
CS_30002.fields = {
	var_0_2.CS_30002_TYPE_FIELD,
	var_0_2.CS_30002_SPLIT_ID_FIELD
}
CS_30002.is_extendable = false
CS_30002.extensions = {}
var_0_2.SC_30003_MAIL_LIST_FIELD.name = "mail_list"
var_0_2.SC_30003_MAIL_LIST_FIELD.full_name = "p30.sc_30003.mail_list"
var_0_2.SC_30003_MAIL_LIST_FIELD.number = 1
var_0_2.SC_30003_MAIL_LIST_FIELD.index = 0
var_0_2.SC_30003_MAIL_LIST_FIELD.label = 3
var_0_2.SC_30003_MAIL_LIST_FIELD.has_default_value = false
var_0_2.SC_30003_MAIL_LIST_FIELD.default_value = {}
var_0_2.SC_30003_MAIL_LIST_FIELD.message_type = MAIL_SIGLE
var_0_2.SC_30003_MAIL_LIST_FIELD.type = 11
var_0_2.SC_30003_MAIL_LIST_FIELD.cpp_type = 10
SC_30003.name = "sc_30003"
SC_30003.full_name = "p30.sc_30003"
SC_30003.nested_types = {}
SC_30003.enum_types = {}
SC_30003.fields = {
	var_0_2.SC_30003_MAIL_LIST_FIELD
}
SC_30003.is_extendable = false
SC_30003.extensions = {}
var_0_2.CS_30004_ID_FIELD.name = "id"
var_0_2.CS_30004_ID_FIELD.full_name = "p30.cs_30004.id"
var_0_2.CS_30004_ID_FIELD.number = 1
var_0_2.CS_30004_ID_FIELD.index = 0
var_0_2.CS_30004_ID_FIELD.label = 3
var_0_2.CS_30004_ID_FIELD.has_default_value = false
var_0_2.CS_30004_ID_FIELD.default_value = {}
var_0_2.CS_30004_ID_FIELD.type = 13
var_0_2.CS_30004_ID_FIELD.cpp_type = 3
CS_30004.name = "cs_30004"
CS_30004.full_name = "p30.cs_30004"
CS_30004.nested_types = {}
CS_30004.enum_types = {}
CS_30004.fields = {
	var_0_2.CS_30004_ID_FIELD
}
CS_30004.is_extendable = false
CS_30004.extensions = {}
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.name = "attachment_list"
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.full_name = "p30.sc_30005.attachment_list"
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.number = 1
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.index = 0
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.label = 3
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.has_default_value = false
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.default_value = {}
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.message_type = ATTACHMENT
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.type = 11
var_0_2.SC_30005_ATTACHMENT_LIST_FIELD.cpp_type = 10
SC_30005.name = "sc_30005"
SC_30005.full_name = "p30.sc_30005"
SC_30005.nested_types = {}
SC_30005.enum_types = {}
SC_30005.fields = {
	var_0_2.SC_30005_ATTACHMENT_LIST_FIELD
}
SC_30005.is_extendable = false
SC_30005.extensions = {}
var_0_2.CS_30006_ID_FIELD.name = "id"
var_0_2.CS_30006_ID_FIELD.full_name = "p30.cs_30006.id"
var_0_2.CS_30006_ID_FIELD.number = 1
var_0_2.CS_30006_ID_FIELD.index = 0
var_0_2.CS_30006_ID_FIELD.label = 2
var_0_2.CS_30006_ID_FIELD.has_default_value = false
var_0_2.CS_30006_ID_FIELD.default_value = 0
var_0_2.CS_30006_ID_FIELD.type = 13
var_0_2.CS_30006_ID_FIELD.cpp_type = 3
CS_30006.name = "cs_30006"
CS_30006.full_name = "p30.cs_30006"
CS_30006.nested_types = {}
CS_30006.enum_types = {}
CS_30006.fields = {
	var_0_2.CS_30006_ID_FIELD
}
CS_30006.is_extendable = false
CS_30006.extensions = {}
var_0_2.SC_30007_ID_LIST_FIELD.name = "id_list"
var_0_2.SC_30007_ID_LIST_FIELD.full_name = "p30.sc_30007.id_list"
var_0_2.SC_30007_ID_LIST_FIELD.number = 1
var_0_2.SC_30007_ID_LIST_FIELD.index = 0
var_0_2.SC_30007_ID_LIST_FIELD.label = 3
var_0_2.SC_30007_ID_LIST_FIELD.has_default_value = false
var_0_2.SC_30007_ID_LIST_FIELD.default_value = {}
var_0_2.SC_30007_ID_LIST_FIELD.type = 13
var_0_2.SC_30007_ID_LIST_FIELD.cpp_type = 3
SC_30007.name = "sc_30007"
SC_30007.full_name = "p30.sc_30007"
SC_30007.nested_types = {}
SC_30007.enum_types = {}
SC_30007.fields = {
	var_0_2.SC_30007_ID_LIST_FIELD
}
SC_30007.is_extendable = false
SC_30007.extensions = {}
var_0_2.CS_30008_ID_FIELD.name = "id"
var_0_2.CS_30008_ID_FIELD.full_name = "p30.cs_30008.id"
var_0_2.CS_30008_ID_FIELD.number = 1
var_0_2.CS_30008_ID_FIELD.index = 0
var_0_2.CS_30008_ID_FIELD.label = 2
var_0_2.CS_30008_ID_FIELD.has_default_value = false
var_0_2.CS_30008_ID_FIELD.default_value = 0
var_0_2.CS_30008_ID_FIELD.type = 13
var_0_2.CS_30008_ID_FIELD.cpp_type = 3
CS_30008.name = "cs_30008"
CS_30008.full_name = "p30.cs_30008"
CS_30008.nested_types = {}
CS_30008.enum_types = {}
CS_30008.fields = {
	var_0_2.CS_30008_ID_FIELD
}
CS_30008.is_extendable = false
CS_30008.extensions = {}
var_0_2.SC_30009_DETAIL_INFO_FIELD.name = "detail_info"
var_0_2.SC_30009_DETAIL_INFO_FIELD.full_name = "p30.sc_30009.detail_info"
var_0_2.SC_30009_DETAIL_INFO_FIELD.number = 1
var_0_2.SC_30009_DETAIL_INFO_FIELD.index = 0
var_0_2.SC_30009_DETAIL_INFO_FIELD.label = 2
var_0_2.SC_30009_DETAIL_INFO_FIELD.has_default_value = false
var_0_2.SC_30009_DETAIL_INFO_FIELD.default_value = nil
var_0_2.SC_30009_DETAIL_INFO_FIELD.message_type = MAIL_DETAIL
var_0_2.SC_30009_DETAIL_INFO_FIELD.type = 11
var_0_2.SC_30009_DETAIL_INFO_FIELD.cpp_type = 10
SC_30009.name = "sc_30009"
SC_30009.full_name = "p30.sc_30009"
SC_30009.nested_types = {}
SC_30009.enum_types = {}
SC_30009.fields = {
	var_0_2.SC_30009_DETAIL_INFO_FIELD
}
SC_30009.is_extendable = false
SC_30009.extensions = {}
var_0_2.CS_30010_ID_FIELD.name = "id"
var_0_2.CS_30010_ID_FIELD.full_name = "p30.cs_30010.id"
var_0_2.CS_30010_ID_FIELD.number = 1
var_0_2.CS_30010_ID_FIELD.index = 0
var_0_2.CS_30010_ID_FIELD.label = 2
var_0_2.CS_30010_ID_FIELD.has_default_value = false
var_0_2.CS_30010_ID_FIELD.default_value = 0
var_0_2.CS_30010_ID_FIELD.type = 13
var_0_2.CS_30010_ID_FIELD.cpp_type = 3
var_0_2.CS_30010_FLAG_FIELD.name = "flag"
var_0_2.CS_30010_FLAG_FIELD.full_name = "p30.cs_30010.flag"
var_0_2.CS_30010_FLAG_FIELD.number = 2
var_0_2.CS_30010_FLAG_FIELD.index = 1
var_0_2.CS_30010_FLAG_FIELD.label = 2
var_0_2.CS_30010_FLAG_FIELD.has_default_value = false
var_0_2.CS_30010_FLAG_FIELD.default_value = 0
var_0_2.CS_30010_FLAG_FIELD.type = 13
var_0_2.CS_30010_FLAG_FIELD.cpp_type = 3
CS_30010.name = "cs_30010"
CS_30010.full_name = "p30.cs_30010"
CS_30010.nested_types = {}
CS_30010.enum_types = {}
CS_30010.fields = {
	var_0_2.CS_30010_ID_FIELD,
	var_0_2.CS_30010_FLAG_FIELD
}
CS_30010.is_extendable = false
CS_30010.extensions = {}
var_0_2.SC_30011_RESULT_FIELD.name = "result"
var_0_2.SC_30011_RESULT_FIELD.full_name = "p30.sc_30011.result"
var_0_2.SC_30011_RESULT_FIELD.number = 1
var_0_2.SC_30011_RESULT_FIELD.index = 0
var_0_2.SC_30011_RESULT_FIELD.label = 2
var_0_2.SC_30011_RESULT_FIELD.has_default_value = false
var_0_2.SC_30011_RESULT_FIELD.default_value = 0
var_0_2.SC_30011_RESULT_FIELD.type = 13
var_0_2.SC_30011_RESULT_FIELD.cpp_type = 3
SC_30011.name = "sc_30011"
SC_30011.full_name = "p30.sc_30011"
SC_30011.nested_types = {}
SC_30011.enum_types = {}
SC_30011.fields = {
	var_0_2.SC_30011_RESULT_FIELD
}
SC_30011.is_extendable = false
SC_30011.extensions = {}
var_0_2.MAIL_SIGLE_ID_FIELD.name = "id"
var_0_2.MAIL_SIGLE_ID_FIELD.full_name = "p30.mail_sigle.id"
var_0_2.MAIL_SIGLE_ID_FIELD.number = 1
var_0_2.MAIL_SIGLE_ID_FIELD.index = 0
var_0_2.MAIL_SIGLE_ID_FIELD.label = 2
var_0_2.MAIL_SIGLE_ID_FIELD.has_default_value = false
var_0_2.MAIL_SIGLE_ID_FIELD.default_value = 0
var_0_2.MAIL_SIGLE_ID_FIELD.type = 13
var_0_2.MAIL_SIGLE_ID_FIELD.cpp_type = 3
var_0_2.MAIL_SIGLE_DATE_FIELD.name = "date"
var_0_2.MAIL_SIGLE_DATE_FIELD.full_name = "p30.mail_sigle.date"
var_0_2.MAIL_SIGLE_DATE_FIELD.number = 2
var_0_2.MAIL_SIGLE_DATE_FIELD.index = 1
var_0_2.MAIL_SIGLE_DATE_FIELD.label = 2
var_0_2.MAIL_SIGLE_DATE_FIELD.has_default_value = false
var_0_2.MAIL_SIGLE_DATE_FIELD.default_value = 0
var_0_2.MAIL_SIGLE_DATE_FIELD.type = 13
var_0_2.MAIL_SIGLE_DATE_FIELD.cpp_type = 3
var_0_2.MAIL_SIGLE_TITLE_FIELD.name = "title"
var_0_2.MAIL_SIGLE_TITLE_FIELD.full_name = "p30.mail_sigle.title"
var_0_2.MAIL_SIGLE_TITLE_FIELD.number = 3
var_0_2.MAIL_SIGLE_TITLE_FIELD.index = 2
var_0_2.MAIL_SIGLE_TITLE_FIELD.label = 2
var_0_2.MAIL_SIGLE_TITLE_FIELD.has_default_value = false
var_0_2.MAIL_SIGLE_TITLE_FIELD.default_value = ""
var_0_2.MAIL_SIGLE_TITLE_FIELD.type = 9
var_0_2.MAIL_SIGLE_TITLE_FIELD.cpp_type = 9
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.name = "attach_flag"
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.full_name = "p30.mail_sigle.attach_flag"
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.number = 4
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.index = 3
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.label = 2
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.has_default_value = false
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.default_value = 0
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.type = 13
var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD.cpp_type = 3
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.name = "read_flag"
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.full_name = "p30.mail_sigle.read_flag"
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.number = 5
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.index = 4
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.label = 2
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.has_default_value = false
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.default_value = 0
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.type = 13
var_0_2.MAIL_SIGLE_READ_FLAG_FIELD.cpp_type = 3
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.name = "attachment_list"
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.full_name = "p30.mail_sigle.attachment_list"
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.number = 6
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.index = 5
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.label = 3
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.has_default_value = false
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.default_value = {}
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.message_type = ATTACHMENT
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.type = 11
var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.cpp_type = 10
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.name = "imp_flag"
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.full_name = "p30.mail_sigle.imp_flag"
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.number = 7
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.index = 6
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.label = 2
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.has_default_value = false
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.default_value = 0
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.type = 13
var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD.cpp_type = 3
MAIL_SIGLE.name = "mail_sigle"
MAIL_SIGLE.full_name = "p30.mail_sigle"
MAIL_SIGLE.nested_types = {}
MAIL_SIGLE.enum_types = {}
MAIL_SIGLE.fields = {
	var_0_2.MAIL_SIGLE_ID_FIELD,
	var_0_2.MAIL_SIGLE_DATE_FIELD,
	var_0_2.MAIL_SIGLE_TITLE_FIELD,
	var_0_2.MAIL_SIGLE_ATTACH_FLAG_FIELD,
	var_0_2.MAIL_SIGLE_READ_FLAG_FIELD,
	var_0_2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD,
	var_0_2.MAIL_SIGLE_IMP_FLAG_FIELD
}
MAIL_SIGLE.is_extendable = false
MAIL_SIGLE.extensions = {}
var_0_2.MAIL_DETAIL_ID_FIELD.name = "id"
var_0_2.MAIL_DETAIL_ID_FIELD.full_name = "p30.mail_detail.id"
var_0_2.MAIL_DETAIL_ID_FIELD.number = 1
var_0_2.MAIL_DETAIL_ID_FIELD.index = 0
var_0_2.MAIL_DETAIL_ID_FIELD.label = 2
var_0_2.MAIL_DETAIL_ID_FIELD.has_default_value = false
var_0_2.MAIL_DETAIL_ID_FIELD.default_value = 0
var_0_2.MAIL_DETAIL_ID_FIELD.type = 13
var_0_2.MAIL_DETAIL_ID_FIELD.cpp_type = 3
var_0_2.MAIL_DETAIL_CONTENT_FIELD.name = "content"
var_0_2.MAIL_DETAIL_CONTENT_FIELD.full_name = "p30.mail_detail.content"
var_0_2.MAIL_DETAIL_CONTENT_FIELD.number = 2
var_0_2.MAIL_DETAIL_CONTENT_FIELD.index = 1
var_0_2.MAIL_DETAIL_CONTENT_FIELD.label = 2
var_0_2.MAIL_DETAIL_CONTENT_FIELD.has_default_value = false
var_0_2.MAIL_DETAIL_CONTENT_FIELD.default_value = ""
var_0_2.MAIL_DETAIL_CONTENT_FIELD.type = 9
var_0_2.MAIL_DETAIL_CONTENT_FIELD.cpp_type = 9
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.name = "attachment_list"
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.full_name = "p30.mail_detail.attachment_list"
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.number = 3
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.index = 2
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.label = 3
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.has_default_value = false
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.default_value = {}
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.message_type = ATTACHMENT
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.type = 11
var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.cpp_type = 10
MAIL_DETAIL.name = "mail_detail"
MAIL_DETAIL.full_name = "p30.mail_detail"
MAIL_DETAIL.nested_types = {}
MAIL_DETAIL.enum_types = {}
MAIL_DETAIL.fields = {
	var_0_2.MAIL_DETAIL_ID_FIELD,
	var_0_2.MAIL_DETAIL_CONTENT_FIELD,
	var_0_2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD
}
MAIL_DETAIL.is_extendable = false
MAIL_DETAIL.extensions = {}
var_0_2.ATTACHMENT_TYPE_FIELD.name = "type"
var_0_2.ATTACHMENT_TYPE_FIELD.full_name = "p30.attachment.type"
var_0_2.ATTACHMENT_TYPE_FIELD.number = 1
var_0_2.ATTACHMENT_TYPE_FIELD.index = 0
var_0_2.ATTACHMENT_TYPE_FIELD.label = 2
var_0_2.ATTACHMENT_TYPE_FIELD.has_default_value = false
var_0_2.ATTACHMENT_TYPE_FIELD.default_value = 0
var_0_2.ATTACHMENT_TYPE_FIELD.type = 13
var_0_2.ATTACHMENT_TYPE_FIELD.cpp_type = 3
var_0_2.ATTACHMENT_ID_FIELD.name = "id"
var_0_2.ATTACHMENT_ID_FIELD.full_name = "p30.attachment.id"
var_0_2.ATTACHMENT_ID_FIELD.number = 2
var_0_2.ATTACHMENT_ID_FIELD.index = 1
var_0_2.ATTACHMENT_ID_FIELD.label = 2
var_0_2.ATTACHMENT_ID_FIELD.has_default_value = false
var_0_2.ATTACHMENT_ID_FIELD.default_value = 0
var_0_2.ATTACHMENT_ID_FIELD.type = 13
var_0_2.ATTACHMENT_ID_FIELD.cpp_type = 3
var_0_2.ATTACHMENT_NUMBER_FIELD.name = "number"
var_0_2.ATTACHMENT_NUMBER_FIELD.full_name = "p30.attachment.number"
var_0_2.ATTACHMENT_NUMBER_FIELD.number = 3
var_0_2.ATTACHMENT_NUMBER_FIELD.index = 2
var_0_2.ATTACHMENT_NUMBER_FIELD.label = 2
var_0_2.ATTACHMENT_NUMBER_FIELD.has_default_value = false
var_0_2.ATTACHMENT_NUMBER_FIELD.default_value = 0
var_0_2.ATTACHMENT_NUMBER_FIELD.type = 13
var_0_2.ATTACHMENT_NUMBER_FIELD.cpp_type = 3
ATTACHMENT.name = "attachment"
ATTACHMENT.full_name = "p30.attachment"
ATTACHMENT.nested_types = {}
ATTACHMENT.enum_types = {}
ATTACHMENT.fields = {
	var_0_2.ATTACHMENT_TYPE_FIELD,
	var_0_2.ATTACHMENT_ID_FIELD,
	var_0_2.ATTACHMENT_NUMBER_FIELD
}
ATTACHMENT.is_extendable = false
ATTACHMENT.extensions = {}
attachment = var_0_0.Message(ATTACHMENT)
cs_30002 = var_0_0.Message(CS_30002)
cs_30004 = var_0_0.Message(CS_30004)
cs_30006 = var_0_0.Message(CS_30006)
cs_30008 = var_0_0.Message(CS_30008)
cs_30010 = var_0_0.Message(CS_30010)
mail_detail = var_0_0.Message(MAIL_DETAIL)
mail_sigle = var_0_0.Message(MAIL_SIGLE)
sc_30001 = var_0_0.Message(SC_30001)
sc_30003 = var_0_0.Message(SC_30003)
sc_30005 = var_0_0.Message(SC_30005)
sc_30007 = var_0_0.Message(SC_30007)
sc_30009 = var_0_0.Message(SC_30009)
sc_30011 = var_0_0.Message(SC_30011)
