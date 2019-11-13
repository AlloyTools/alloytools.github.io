import java.io.File;

import edu.mit.csail.sdg.alloy4.A4Reporter;
import edu.mit.csail.sdg.alloy4.XMLNode;
import edu.mit.csail.sdg.alloy4compiler.ast.Command;
import edu.mit.csail.sdg.alloy4compiler.ast.Expr;
import edu.mit.csail.sdg.alloy4compiler.ast.Module;
import edu.mit.csail.sdg.alloy4compiler.parser.CompUtil;
import edu.mit.csail.sdg.alloy4compiler.translator.A4Options;
import edu.mit.csail.sdg.alloy4compiler.translator.A4Solution;
import edu.mit.csail.sdg.alloy4compiler.translator.A4SolutionReader;
import edu.mit.csail.sdg.alloy4compiler.translator.TranslateAlloyToKodkod;

public class EvaluatorExample {

    private static String model = "sig Point {} \n" + "\n" + "run { #Point > 1 } for 3 but 3 Int";
    private static String outputfilename = "/tmp/myissue.xml";

    public static void main(String[] args) throws Exception {
        A4Reporter rep = new A4Reporter();
        File tmpAls = CompUtil.flushModelToFile(model, null);
        {
            Module world = CompUtil.parseEverything_fromString(rep, model);
            A4Options opt = new A4Options();
            opt.originalFilename = tmpAls.getAbsolutePath();
            opt.solver = A4Options.SatSolver.SAT4J;
            Command cmd = world.getAllCommands().get(0);
            A4Solution sol = TranslateAlloyToKodkod.execute_command(rep, world.getAllReachableSigs(), cmd, opt);
            assert sol.satisfiable();
            sol.writeXML(outputfilename);

            // eval with existing A4Solution
            Expr e = CompUtil.parseOneExpression_fromString(world, "univ");
            System.out.println(sol.eval(e));
            e = CompUtil.parseOneExpression_fromString(world, "Point");
            System.out.println(sol.eval(e));
        }
        // reload everything from files
        {
            XMLNode xmlNode = new XMLNode(new File(outputfilename));
            String alloySourceFilename = xmlNode.iterator().next().getAttribute("filename");
            Module ansWorld = CompUtil.parseEverything_fromFile(rep, null, alloySourceFilename);
            A4Solution ans = A4SolutionReader.read(ansWorld.getAllReachableSigs(), xmlNode);

            Expr e = CompUtil.parseOneExpression_fromString(ansWorld, "univ");
            System.out.println(ans.eval(e));
            e = CompUtil.parseOneExpression_fromString(ansWorld, "Point");
            System.out.println(ans.eval(e));
        }
    }
}
