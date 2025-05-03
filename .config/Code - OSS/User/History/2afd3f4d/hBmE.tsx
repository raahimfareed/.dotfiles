import TopNavLink from "@/Components/TopNavLink";
import { Head } from "@inertiajs/react";

const Index = () => {
    return (
        <>
            <Head title="Welcome!" />
            <div>
                <div className="w-full h-32 shadow flex items-center gap-3">
                    <TopNavLink name="Home" />
                    <TopNavLink name="Login" />
                    <TopNavLink name="Join Today" />
                </div>
            </div>
        </>
    );
}


export default Index;
