#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/prototype
========================================================================================
    Github : https://github.com/nf-core/prototype
    Website: https://nf-co.re/prototype
    Slack  : https://nfcore.slack.com/channels/prototype
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { PROTOTYPE } from './workflows/prototype'

//
// WORKFLOW: Run main nf-core/prototype analysis pipeline
//
workflow NFCORE_PROTOTYPE {
    PROTOTYPE ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_PROTOTYPE ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
