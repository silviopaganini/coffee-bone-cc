###
# Requester #

Wrapper for `$.ajax` calls

###
class Requester

    @requests : []

    @request: ( data ) =>
        ###
        `data = {`<br>
        `  url         : String`<br>
        `  type        : "POST/GET/PUT"`<br>
        `  data        : Object`<br>
        `  dataType    : jQuery dataType`<br>
        `  contentType : String`<br>
        `}`
        ###

        r = $.ajax {

            url         : data.url
            type        : if data.type then data.type else "POST",
            data        : if data.data then data.data else null,
            dataType    : if data.dataType then data.dataType else "json",
            contentType : if data.contentType then data.contentType else "application/x-www-form-urlencoded; charset=UTF-8",
            processData : if data.processData != null and data.processData != undefined then data.processData else true

        }

        r.done data.done
        r.fail data.fail

        r

module.exports = Requester
