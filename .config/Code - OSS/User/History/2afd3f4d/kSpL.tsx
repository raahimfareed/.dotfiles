import TopNavLink from "@/Components/TopNavLink";
import { Head } from "@inertiajs/react";

const Index = () => {
    return (
        <>
            <Head title="Welcome!" />
            <nav className="flex items-center h-12 justify-between w-full px-12">
                <a href="">Typio</a>
                <div className="w-fit flex items-center gap-12">
                    <TopNavLink name="Home" />
                    <TopNavLink name="Login" />
                    <TopNavLink name="Join Today" className="rounded py-2 px-4 bg-[#8DECB4] text-[#141E46] hover:opacity-80 transition-opacity" />
                </div>
            </nav>
        </>
    );
}


export default Index;
