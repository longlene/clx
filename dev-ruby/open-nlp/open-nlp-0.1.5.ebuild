# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" Ruby bindings to the OpenNLP tools, a Java machine learning toolkit for natural language processing (NLP)"
HOMEPAGE="https://github.com/louismullie/open-nlp"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bind-it-0.2.5"
ruby_add_rdepend ">=dev-ruby/rspec-0"

