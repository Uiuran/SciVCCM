//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//    Sourceforge: https://sourceforge.net/p/scivccm
//    
//    Description: Plot the firing rate curve for the model inside the list modellist, use currentinterval to excite the membrane model
//    always discarding the transient.
//
//    Currentinterval must be a three(3) dimensional column vector with: currentinterval(1) the initial value, currentinterval(2) the
//    final value, currentinterval(3) the interval between two input currents in which the firing rate will be calculated.
//
//    Note that modellist(3) must be a four dimensional column vector with the current previously setted to constant mode 1

function [firingrate,current] = firingRateCurve(x0,t,transient,modellist,currentinterval)

    firingrate = [];
    current = [];

    for i= currentinterval(1):currentinterval(3):currentinterval(2)
        modellist(3)(3) = i;
        y = ode(x0,0,t,modellist);
        firingrate = [firingrate; detectFiringRate(y(1,transient:$)',t(transient:$),700); ];
        current = [current; i];
    end

endfunction
