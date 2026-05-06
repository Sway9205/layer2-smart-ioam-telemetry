// Main P4 program for Layer-2 IOAM + L2-SMART
#include "headers.p4"
#include "parser.p4"
#include "actions.p4"
#include "tables.p4"
#include "control.p4"

package simple_switch(
    Parser p,
    VerifyChecksum vr,
    Ingress ig,
    Egress eg,
    ComputeChecksum ck,
    Deparser d
);
