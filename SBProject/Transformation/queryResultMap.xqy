xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.example.org";
(:: import schema at "../XSDs/inout_param.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbDcvRequest";
(:: import schema at "../Resources/dbDcvRequest_table.xsd" ::)

declare variable $res as element() (:: schema-element(ns1:DcvRequestCollection) ::) external;

declare function local:queryResultMap($res as element() (:: schema-element(ns1:DcvRequestCollection) ::)) as element() (:: schema-element(ns2:dcvRequestCollection) ::) {
    <ns2:dcvRequestCollection>
        {
            for $DcvRequest in $res/ns1:DcvRequest
            return 
            <ns2:dcvRequest>
                <ns2:noDcv>{fn:data($DcvRequest/ns1:dcvhNoDcv)}</ns2:noDcv>
                <ns2:custCode>{fn:data($DcvRequest/ns1:dcvhCustCode)}</ns2:custCode>
                <ns2:custName>{fn:data($DcvRequest/ns1:dcvhCustName)}</ns2:custName>
                <ns2:noPC>{fn:data($DcvRequest/ns1:dcvhNoPc)}</ns2:noPC>
                <ns2:status>{fn:data($DcvRequest/ns1:dcvhStatus)}</ns2:status>
                <ns2:apprValue>{fn:data($DcvRequest/ns1:dcvhValue)}</ns2:apprValue>
                <ns2:location>{fn:concat($DcvRequest/ns1:dcvhLocation, ' - ', $DcvRequest/ns1:dcvhArea,' - ', fn:data($DcvRequest/ns1:dcvhRegion))}</ns2:location></ns2:dcvRequest>
        }</ns2:dcvRequestCollection>
};

local:queryResultMap($res)
