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
                    <TopNavLink name="Join Today" className="rounded py-2 px-4 bg-[#8DECB4] text-[#141E46]" />
                </div>
            </div>
        </>
    );
}


export default Index;
